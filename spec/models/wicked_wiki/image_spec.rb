require 'spec_helper'

describe WickedWiki::Image do
  let(:image) { FactoryGirl.create(:image) }
  describe "validates" do
  	specify "presence of name" do
  	  image.name = ""
  	  image.should_not be_valid
  	end

    specify "uniqueness of name" do

    end

  	specify "presence of img file" do
  	  image.file_file_name = ""
  	  image.should_not be_valid
  	end

  	specify "present of wiki_id " do
  	  image.wiki_id = nil
  	  image.should_not be_valid
  	end


  end
end
