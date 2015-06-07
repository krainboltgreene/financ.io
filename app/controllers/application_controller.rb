class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_organization!

  def current_account
    AccountDecorator.new(super || AccountNull.new)
  end

  def account_signed_in?
    current_account.is_a? Account
  end

  def authenticate_organization!
    current_organization.is_a?(Organization)
  end
  private :authenticate_organization!

  def authorize_organization!
    unless current_organization == current_account.organization
      redirect_to new_account_session_path
    end
  end
  private :authorize_organization!

  def current_organization
    env["Groundskeeper-Tenant"] || OrganizationNull.new
  end
  private :current_organization
  helper_method :current_organization
end
