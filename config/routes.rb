Huanhao::Application.routes.draw do


  resources :images_indices

  resources :goods do
     collection do
        post :add_new
      end
  end
  resources :goods_types

  resources :images_indices

  resources :question_result_details

  resources :question_results

  resources :web_infos

  resources :question_details

  resources :question_categories

  

  get 'kindeditor/images_list'

  post 'kindeditor/upload'

  resources :applies

  resources :page_temps

  resources :course_types

  resources :courses


  resources :adds

  resources :friend_links

match '/', :to => 'homes#index'
match '/homes/forums/:id/:page',  
  :controller => 'homes',  
  :action => 'forums',  
  :requirements => {:id=>/\d+/,:page => /\d+/},  
  :page => nil ,
  :id => nil  

 match '/homes/articles/:id',  
  :controller => 'homes',  
  :action => 'articles',  
  :requirements => {:id=>/\d+/},  
  :id => nil  


 match '/homes/courses/:id',  
  :controller => 'homes',  
  :action => 'courses',  
  :requirements => {:id=>/\d+/},  
  :id => nil    

match '/homes/forums/:id/',  
  :controller => 'homes',  
  :action => 'forums',  
  :requirements => {:id=>/\d+/},  
  :id => nil  

  match '/homes/goods/:id/',  
  :controller => 'homes',  
  :action => 'goods',  
  :requirements => {:id=>/\d+/},  
  :id => nil  

  match '/homes/goods/:id/:page',  
  :controller => 'homes',  
  :action => 'goods',  
  :requirements => {:id=>/\d+/,:page => /\d+/},  
  :page => nil ,
  :id => nil  
  resources :events
  resources :homes do
      collection do
        get :apply
        get :forums
        get :goods
        get :good
        get :articles
        get :read
      end
  end


  resources :questions do
    collection do
      get :save_question
    end
  end


  resources :question_bases do
    collection do
      post :answer
    end
  end


  resources :admin do
      collection do
        get :delete_cache
      end
  end

  resources :forums do
  collection do
  get :select_with_ajax
  post :select_with_ajax
  end
  end
  
  resources :articles do
     collection do
        post :add_index
      end
  end


  get "admin/dashboard"

  resources :users do
    collection do
      post :login
      get  :login
      get :logout
      
    end
  end
  
end
