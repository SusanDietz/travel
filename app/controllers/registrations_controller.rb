class RegistrationsController < Devise::RegistrationsController
  protected
	  def facebook
	  end

	  def vkontakte
	  end
	end

  def after_sign_up_path_for(resource)
    'google.com'
  end
end
