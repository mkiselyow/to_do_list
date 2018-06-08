# frozen_string_literal: true

# changing devise controller to respond ajax
class RegistrationsController < Devise::RegistrationsController
  respond_to :json, :js

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up, { now: true }
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :alert, :"signed_up_but_#{resource.inactive_message}", { now: true }
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      set_flash_message :alert, :invalid, { scope: %i[devise failure], now: true, authentication_keys: 'email' }
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed, { now: true }
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end
end
