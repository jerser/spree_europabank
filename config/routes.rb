Spree::Core::Engine.routes.draw do
  resources :orders do
    resource :checkout, :controller => 'checkout' do
      member do
        get  :europabank_confirm
        post :europabank_return
      end
    end
  end
end
