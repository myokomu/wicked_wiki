require 'spec_helper'

describe WickedWiki::WikisController do
  routes { WickedWiki::Engine.routes }
  let(:wiki) { FactoryGirl.create(:wiki, protection: "semi-protection") }
  before { @wiki = FactoryGirl.create(:wiki, protection: "semi-protection") }
  context "action that requires no authorization" do
    specify "index" do
      get :index
      expect(response).to render_template :index
    end

    specify "show" do
      get :show, {id: wiki}
      expect(response).to render_template :show
    end
  end

  describe "not authorized to" do
    it_behaves_like "not authorized to", :new
    it_behaves_like "not authorized to", :create, :wiki
    it_behaves_like "not authorized to", :edit, :wiki
    it_behaves_like "not authorized to", :update, :wiki
    specify do
      pending 'it_behaves_like "not authorized to", :delete'
    end
  end
end