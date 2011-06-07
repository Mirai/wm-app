WmApp::Application.routes.draw do
  root :to => "factions#index"

  resources :models do
    collection do
      post :add_weapon, :add_spell
    end
  end
  resources :model_types
  resources :sub_types
  resources :factions
  resources :weapons
  resources :spells
  resources :feats
  resources :abilities
  resources :orders
  resources :damage_grids

  resources :warcasters, :warjacks, :units

  match 'cygnar' => 'models#index', :id => 1
  match 'khador' => 'models#index', :id => 2
  match 'protectorateofmenoth' => 'models#index', :id => 3
  match 'cryx' => 'models#index', :id => 4

  match 'models/:id/remove_weapon/:weapon_id' => 'models#remove_weapon'
  match 'models/:id/remove_spell/:spell_id' => 'models#remove_spell'
end
