require 'spec_helper'
describe "diff" do
  
  let!(:wiki) { FactoryGirl.create(:wiki) }
  let!(:old_revision) { FactoryGirl.create(:revision, wiki: wiki, content: wiki.content)}
  let!(:new_revision) { FactoryGirl.create(:revision, wiki: wiki)}
  let!(:diff) { WickedWiki::Diff.new(new_revision.content, old_revision.content).compare_articles }

  before do
    visit "/diff/#{new_revision.id}/and/#{old_revision.id}"
  end  

  context "diff section" do
    specify "has plus sign count == diff.length" do 
      page.all(".diff_plus_sign").count.should eql(diff.length)
    end

    specify "has minus sign count == diff.length" do
      page.all(".diff_minus_sign").count.should eql(diff.length)
    end

    specify "has source_diff.count == diff.length" do
      page.all(".source_diff").count.should eql(diff.length)
    end

    specify "has target_diff.count == diff.length" do
      page.all(".target_diff").count.should eql(diff.length)
    end
  end

  specify "should render target's content" do
    page.should have_content(new_revision.content)
  end 
end