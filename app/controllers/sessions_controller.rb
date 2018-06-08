# frozen_string_literal: true

# changing devise controller to respond ajax
class SessionsController < Devise::SessionsController
  respond_to :json, :js

  def create
    self.resource = User.find_by_email(sign_in_params[:email])
    if resource&.valid_password?(sign_in_params[:password])
      flash.now[:notice] = 'Signed successfully'
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    elsif resource.nil?
      self.resource = resource_class.new(sign_in_params)
      flash.now[:alert] = I18n.t(:invalid_email, scope: %i[devise failure], default: 'Invalid Email')
    elsif !resource.valid_password?(sign_in_params[:password])
      flash.now[:alert] = I18n.t(:invalid_password, scope: %i[devise failure], default: 'Invalid Password')
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    flash.now[:notice] = 'Signed out successfully'
    yield if block_given?
    respond_to_on_destroy
  end

  private

  def respond_to_on_destroy
    respond_to do |format|
      format.html { head :no_content }
      format.js
    end
  end
end
