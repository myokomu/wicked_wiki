require 'spec_helper'
describe "revisions" do
  before do
    @wiki = FactoryGirl.create(:wiki)
    @old_revision = FactoryGirl.create(:revision, wiki: @wiki, content: @wiki.content)
    @new_revision = FactoryGirl.create(:revision, wiki: @wiki)
  end

  describe "index" do
    before { visit wiki_revisions_path(@wiki)}
    context "revision links" do
      specify "total count == Revisons.count" do
        page.all(".revision_link").count.should eq(2)
      end

      specify "each has a source radio button" do
        page.all(".radio_source").count.should eq(2)
      end

      specify "each has a target radio button" do
        page.all(".radio_target").count.should eq(2)
      end
    end
  end

  describe "show" do
    before { visit wiki_revision_path(@wiki, @old_revision) }
    specify "has title" do
      page.should have_content(@old_revision.title)
    end

    specify "has content" do
      page.should have_content(@old_revision.content)
    end
  end

  specify "compare button should work" do
    visit wiki_path(@wiki) 
    click_link "Show all revisions"
    choose "target_id_#{@new_revision.id}"
    choose "source_id_#{@old_revision.id}"
    click_button "Compare"   
    page.should have_selector(".source_diff")
  end
end