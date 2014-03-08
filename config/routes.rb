include WickedWiki::Internationalization

WickedWiki::Engine.routes.draw do
  scope "(:locale)", :locale => locale_url_param do
    get 'diff/:s_id/and/:t_id', to: 'diff#show'
    get 'diff/create',  to: 'diff#create'

    resources :wikis do
      resources :images
      resources :revisions, only: [:index, :show]
    end  
  end
end