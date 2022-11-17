Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  get("/register", { :controller => "users", :action => "register"})
  get("/insert_user", { :controller => "users", :action => "create"})
  get("/compare", { :controller => "application", :action => "compare"})
  get("/analytics", { :controller => "application", :action => "analytics"})
  get("/properties", { :controller => "application", :action => "properties"})
  get("/compare", { :controller => "application", :action => "compare"})



end
