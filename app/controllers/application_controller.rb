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

  def strip_pjax_param
    params.delete(:_pjax)
    request.env['QUERY_STRING'] = request.env['QUERY_STRING'].sub(/_pjax=[^&]+&?/, '')

    request.env.delete('rack.request.query_string')
    request.env.delete('rack.request.query_hash')
    request.env.delete('action_dispatch.request.query_parameters')

    request.instance_variable_set('@original_fullpath', nil)
    request.instance_variable_set('@fullpath', nil)
  end

  def set_pjax_url
    response.headers['X-PJAX-URL'] = request.url
  end

end
