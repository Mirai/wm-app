WmApp::Application.routes.draw do
  root :to => "factions#index"

  resources :units do
    collection do
      post :add_weapon
      post :add_spell
    end
  end
  resources :unit_types
  resources :factions
  resources :weapons
  resources :spells
  resources :feats
  
  resources :warcasters, :warjacks
  
  match 'cygnar' => 'cygnar#index'
  match 'khador' => 'khador#index'
  match 'protectorateofmenoth' => 'protectorate#index'
  match 'cryx' => 'cryx#index'
end
