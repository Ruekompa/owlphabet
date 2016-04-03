class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def pjax_request?
  	env['HTTP_X_PJAX'].present? and request.xhr?
  end

  def pjax_layout
  	false
  end


  def set_pjax_url
    response.headers['X-PJAX-URL'] = request.url
  end

end
