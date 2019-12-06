class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    new_santa_event_url
  end

end
