class RegistrationsController < Devise::RegistrationsController
  respond_to :json, :js
end
