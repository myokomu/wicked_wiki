module WickedWiki::Authorization

  def authorize
    if user_authorized_to?(action_name) == false
      redirect_to auth_redirect_path
      flash[:danger] = "You are not authorized to access this page."
    end
  end
 
  def user_authorized_to?(action)
    action = action.to_sym
    protection = convert_controller_name(controller_name, action)
    action = convert_action_name(controller_name, action)
    send(WickedWiki.protections[protection][action])
  end      

  def auth_redirect_path
    path = WickedWiki.auth_redirect_path
    if path.start_with?("wicked_wiki_")
      send(path[12..-1])
    else
      main_app.send(path)
    end
  end

##Rules for parsing WickedWiki.protections
  def convert_controller_name(controller, action)
    if new_wiki?(controller, action)
      "general" 
    elsif create_wiki?(controller, action)
      wiki_params[:protection]
    elsif new_or_create_image?(controller, action)
      WickedWiki::Wiki.find(params[:wiki_id]).protection
    else
      WickedWiki::Wiki.find(params[:id]).protection
    end
  end
  
  def convert_action_name(controller, action)
    if (new_or_create_image?(controller, action) || update_wiki?(action))
      :edit
    else
      action
    end
  end
  
  def new_or_create_image?(controller, action)
    controller.eql?("images") && (action.eql?(:new) || action.eql?(:create))
  end
  
  def new_wiki?(controller, action)
    controller.eql?("wikis") && action.eql?(:new)  end

  def update_wiki?(action) ##only wiki can update so one arg is enough
  	action.eql?(:update)  
  end

  def create_wiki?(controller, action)
    controller.eql?("wikis") && action.eql?(:create)  
  end
end