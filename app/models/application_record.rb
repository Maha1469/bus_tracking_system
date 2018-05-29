class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    end
end
