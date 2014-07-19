class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  
  private

  def set_locale
    locale = params[:locale] || cookies[:locale] || I18n.default_locale
    if locale != cookies[:locale]
      cookies[:locale] = {value: locale, domain: Settings.cookie_domain}
    end
    I18n.locale = locale
  end
end
