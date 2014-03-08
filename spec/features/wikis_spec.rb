require 'spec_helper'
describe "wikis" do

  let(:wiki) { FactoryGirl.create(:wiki, protection: "semi-protection") }
  let(:user) { FactoryGirl.create(:user)}
  
  specify "elasticsearch" do
    pending "Skipping elastcsearch/tire tests for now."
  end

  describe "index" do
    context "wiki entries" do
      before do
        @titles = Array.new(11).map do |t| 
          t = FactoryGirl.create(:wiki).title
        end
        visit wikis_path
      end

      it "should show the lattest entry" do
        page.should have_content(@titles.last)
      end
  
      it "should show only ten entries" do
        page.all(".wiki-title").count.should eql(10)
      end
  
      it "should not show not-so-recent entries" do
        page.should_not have_content(@titles.first)
      end
    end    

    context "new button" do
      before { stub_general_create } 
      specify "not visible to unauthorized user" do
        visit wikis_path
        expect(page).not_to have_link('New Wiki')
      end
      specify "visible to authorized user" do
        sign_in user
        visit wikis_path
        expect(page).to have_link('New Wiki')
      end
    end
  end


  describe "new" do
    context "selecting protection" do
      before do
        sign_in user
        visit new_wiki_path
      end

      context "authorized type" do
        specify "should be available" do
          page.should have_content("no protection" && "semi-protection" && "creator protection")
        end

        specify "when there's only one authorized type, it will be auto-selected" do
          sign_out
          visit new_wiki_path
          page.should have_selector("#auto-selected-protection")
        end
      end

      context "unauthorized type" do
        specify "shoudn't be available" do
          page.should_not have_content("full protection")
        end

        specify "should be available if requirement reached" do
          sign_out
          create_admin_and_sign_in
          visit new_wiki_path
          page.should have_content("full protection")
        end
      end
    end

    context "creating a page" do
      before do 
        sign_in user
        visit new_wiki_path
      end
      specify "w/ invalid info should get error messages" do
        click_button('Create Wiki')
        page.should have_content("4 errors")
      end

      specify "with valid info should create the page" do
        fill_in "wiki_title", with: "title"
        fill_in "wiki_content", with: "content"
        select "semi-protection", from: "wiki_protection"
        click_button('Create Wiki')
        page.should have_content("Wiki created!")
      end
    end
  end

  describe "show" do
    before { visit wiki_path(wiki) }
    context "visible links" do
      specify "Show all revisions link works" do
        click_link('Show all revisions')
        page.should have_button('Compare')
      end

      specify "View all images link works" do
        click_link('View all images')
        page.should have_content("#{wiki.title}: images")
      end
    end

    context "edit button" do
      specify "not visible to unauthorized user" do
        page.should_not have_link('Edit')
      end

      specify "visible to authorized user" do
        sign_in user
        visit wiki_path(wiki)
        page.should have_link('Edit')
      end
    end

    context "delete button" do
      before do
        sign_in user
        visit wiki_path(wiki)
      end

      specify "not visible to unauthorized user" do
        pending "page.should_not have_button('Delete')"
      end

      context "visible" do
        before do
          sign_out
          create_admin_and_sign_in
        end     

        specify "to authorized user" do
          pending "page.should have_button('Delete Wiki')"
        end

        specify "and works!" do
          pending 'Pop up are you sure after clicking delete'
        end
      end
    end
  end

  describe "edit" do
    context "update page" do
      before do
        sign_in user
        visit edit_wiki_path(wiki)
      end  

      specify "w/ invalid info should get errors" do
        fill_in "wiki_content", with: ""
        click_button 'Done Editing'
        page.should have_content("2 errors")
      end

      specify "w/ valid info should update wiki" do
        fill_in :wiki_content, with: "Nippleon was born in 1769."
        click_button 'Done Editing'
        page.should have_content("Wiki updated!")
      end
    end
  end
end