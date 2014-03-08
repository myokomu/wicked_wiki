require 'spec_helper'
describe "images" do
  
  let(:wiki) { FactoryGirl.create(:wiki, protection: "semi-protection") }
  let(:image) { FactoryGirl.create(:image, wiki: wiki) }
  describe "index" do

  end

  describe "show" do
  end

  describe "new" do
  end

  describe "destroy" do
  end

end