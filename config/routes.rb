Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  get("/register", { :controller => "users", :action => "register"})
  get("/insert_user", { :controller => "users", :action => "create"})



end
