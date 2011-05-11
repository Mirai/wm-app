WmApp::Application.routes.draw do
  root :to => "factions#index"

  resources :units do
    collection do
      post :add_weapon, :add_spell
    end
  end
  resources :unit_types
  resources :sub_types
  resources :factions
  resources :weapons
  resources :spells
  resources :feats
  resources :abilities
  resources :orders
  resources :damage_grids
  
  resources :warcasters, :warjacks, :squads
  
  match 'cygnar' => 'units#index', :id => 1
  match 'khador' => 'units#index', :id => 2
  match 'protectorateofmenoth' => 'units#index', :id => 3
  match 'cryx' => 'units#index', :id => 4
  
  match 'units/:id/remove_weapon/:weapon_id' => 'units#remove_weapon'
  match 'units/:id/remove_spell/:spell_id' => 'units#remove_spell'
end
