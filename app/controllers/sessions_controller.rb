# frozen_string_literal: true

# changing devise controller to respond ajax
class SessionsController < Devise::SessionsController
  respond_to :json, :js

  def create
    self.resource = User.find_by_email(sign_in_params[:email])
    if resource&.valid_password?(sign_in_params[:password])
      set_flash_message :notice, :signed_in, {now: true}
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    elsif resource.nil? || !resource.valid_password?(sign_in_params[:password])
      self.resource = resource_class.new(sign_in_params)
      set_flash_message :alert, :invalid, { scope: %i[devise failure], now: true, authentication_keys: 'email' }
    end
  end

  def destroy
    super
    set_flash_message :notice, :signed_out, {now: true}
  end

  private

  def respond_to_on_destroy
    respond_to do |format|
      format.html { head :no_content }
      format.js
    end
  end
end
