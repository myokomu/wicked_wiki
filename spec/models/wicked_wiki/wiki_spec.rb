require 'spec_helper'

describe WickedWiki::Wiki do
  let(:wiki) { FactoryGirl.create(:wiki) }
  describe "validation" do

  	it "requires title present" do
  	  wiki.title = ""
  	  wiki.should_not be_valid
  	end

    it "requires unique title" do
      dup = wiki.dup
      dup.should_not be_valid
    end

    it "won't allow ridiculously long titles" do
      wiki.title = "r" * 145
      wiki.should_not be_valid
    end  

  	it "requires content present" do
  	  wiki.content = ""
  	  wiki.should_not be_valid
  	end

    it "requires content >= 5 chars" do
      wiki.content = "a"*4
      wiki.should_not be_valid
    end

    it "require either ip or user_id" do
      wiki.ip = nil
      wiki.user_id = nil
      wiki.should_not be_valid
    end
  end

  describe "methods" do
    describe "#save_and_create_revision" do
      before do
        @w = WickedWiki::Wiki.new(FactoryGirl.attributes_for(:wiki))
        @w.save_and_create_revision
      end      
      specify "should save wiki" do
        expect(WickedWiki::Wiki.last).to eq(@w)
      end
      specify "should save revision" do
        expect(WickedWiki::Revision.last.wiki).to eq(@w)
      end
    end
  end
end
