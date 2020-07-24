Rails.application.routes.draw do
  # Routes for the Post resource:

  # CREATE
  get("/posts/new", { :controller => "posts", :action => "new_form" })
  post("/create_post", { :controller => "posts", :action => "create_row" })

  # READ
  get("/posts", { :controller => "posts", :action => "index" })
  get("/posts/:id_to_display", { :controller => "posts", :action => "show" })

  # UPDATE
  get("/posts/:prefill_with_id/edit", { :controller => "posts", :action => "edit_form" })
  post("/update_post/:id_to_modify", { :controller => "posts", :action => "update_row" })

  # DELETE
  get("/delete_post/:id_to_remove", { :controller => "posts", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
