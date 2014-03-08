require 'spec_helper'

describe WickedWiki::Revision do
  let(:revision) { FactoryGirl.create(:revision) }
  describe "validation" do

  	it "requires revision_id present" do
  	  revision.wiki_id = ""
  	  revision.should_not be_valid
  	end

  	it "requires content present" do
  	  revision.content = ""
  	  revision.should_not be_valid
  	end

    it "require either ip or user_id" do
      revision.ip = nil
      revision.user_id = nil
      revision.should_not be_valid
    end
  end

  describe "methods" do
  	specify "#create" do
  	  wiki = FactoryGirl.create(:wiki)
  	  WickedWiki::Revision.create(wiki)
  	  expect(WickedWiki::Revision.last.wiki).to eql(wiki)
  	end
  end
end
