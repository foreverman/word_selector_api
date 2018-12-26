Rails.application.routes.draw do
  post 'words/fuzzy_search', to: 'words#fuzzy_search'
  get 'words/fuzzy_match', to: 'words#fuzzy_match'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
