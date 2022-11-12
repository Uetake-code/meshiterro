class ApplicationController < ActionController::Base
  before_action :configure_premitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  protected

  def configure_premitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

    before_action :authenticate_user!,except: [:top]
    before_action :configure_permitted_parameters, if: :devise_controller?
end
