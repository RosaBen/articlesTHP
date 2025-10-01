class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

protected

def after_sign_in(resource)
  root_path
end

def after_sign_out(resource)
  root_path
end

end
