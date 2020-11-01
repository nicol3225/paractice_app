Rails.application.routes.draw do
  get  "/"                =>  "home#about" 
  #ユーザーコントローラ
  post "users/login_form" => "users#logform"
  # get  "users/mypage"     => "users#mypage" 
  get  "users/login"      => "users#login"
  get  "users/new"        => "users#new"
  post "users/create"     => "users#create"
  get  "users/logoff"     => "users#logoff"
  post "users/create"     => "users#create" 
  get  "users/:id"        => "users#mypage" 
  get  "users/:id/edit"   => "users#edit" 
  patch "users/:id/update" => "users#update" 
  #ポストコントローラ
  post "posts/create"     => "posts#create"
  get  "posts/new"        => "posts#new"
  get  "posts/index"      => "posts#index"
  get  "posts/new"        => "posts#new"
  get  "posts/:id"        => "posts#detail"
  get  "posts/:id/edit"   => "posts#edit"
  get "posts/:id/reply_form" => "posts#reply_form"
  post "posts/:id/reply" => "posts#reply"
  
  # post "posts/update/:up_id" => "posts#update"
  patch "posts/:id/update" => "posts#update"
  get "posts/:id/delete" => "posts#delete"
  get "posts/:id/like/:where" => "posts#like"
  get "posts/:id/like_delete/:where" => "posts#like_delete"
  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
