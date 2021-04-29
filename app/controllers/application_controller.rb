class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_user!

 def index
end

def new
end

 private
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_furigana, :last_name_furigana, :birth_date])
 end
end
