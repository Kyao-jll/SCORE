Rails.application.routes.draw do



  # Routes for the Property resource:

  # CREATE
  post("/insert_property", { :controller => "properties", :action => "create" })
          
  # READ
  get("/properties", { :controller => "properties", :action => "index" })
  
  get("/properties/:path_id", { :controller => "properties", :action => "show" })
  
  # UPDATE
  
  post("/modify_property/:path_id", { :controller => "properties", :action => "update" })
  
  # DELETE
  get("/delete_property/:path_id", { :controller => "properties", :action => "destroy" })

  #------------------------------

  # Routes for the Score resource:

  # CREATE
  post("/insert_score", { :controller => "scores", :action => "create" })
          
  # READ
  get("/scores", { :controller => "scores", :action => "index" })
  
  get("/scores/:path_id", { :controller => "scores", :action => "show" })
  
  # UPDATE
  
  post("/modify_score/:path_id", { :controller => "scores", :action => "update" })
  
  # DELETE
  get("/delete_score/:path_id", { :controller => "scores", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
