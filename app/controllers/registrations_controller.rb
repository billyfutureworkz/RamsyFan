class RegistrationsController < Devise::RegistrationsController

  protected
    def after_sign_up_path_for(resource)
      dishes_path  
    end
end