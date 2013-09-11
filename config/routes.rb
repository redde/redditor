Redditor::Engine.routes.draw do
  namespace :admin do
    resources :pages do
      resources :text_blocks, :video_blocks
      resources :image_blocks, :images, :controller => "image_blocks" do
        post :update_post, :on => :member
      end
      resources :slider_blocks do
        resources :images do
          get 'sort', :on => :collection
        end
      end
      post 'sort', :on => :member
      post 'create_image', :on => :member
    end
  end
end
