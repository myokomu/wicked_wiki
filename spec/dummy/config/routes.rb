Rails.application.routes.draw do

  devise_for :users
  mount WickedWiki::Engine => "/"
  root 'welcome#index'
end
