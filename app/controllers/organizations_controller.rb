class OrganizationsController < ApplicationController
  skip_before_action :authenticate_organization!, only: [:new, :create]
  def new
    @organization = Organization.new
  end

  def create
    organization = Organization.new(OrganizationDenormalizer.new(params[:organization]))

    if organization.save
      redirect_to new_account_registration_url(subdomain: organization.slug)
    else
      render :new
    end
  end
end
