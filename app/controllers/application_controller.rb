class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_account
    AccountDecorator.new(super || AccountNull.new)
  end

  def account_signed_in?
    current_account.is_a? Account
  end
end
