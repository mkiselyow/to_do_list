class SessionsController < Devise::SessionsController  
  respond_to :json, :js
  def create
    self.resource = User.find_by_email(sign_in_params[:email])
    if self.resource and self.resource.valid_password?(sign_in_params[:password])
      # flash.clear
      flash.now[:notice] = ('Signed successfully')
      #set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with self.resource, location: after_sign_in_path_for(resource)
    elsif self.resource.nil?
      self.resource = resource_class.new(sign_in_params)
      # flash.clear
      flash.now[:alert] = (I18n.t(:invalid_email, scope: [:devise, :failure], default: 'Invalid Email'))
      # render :new
    elsif not self.resource.valid_password?(sign_in_params[:password])
      # flash.clear
      flash.now[:alert] = (I18n.t(:invalid_password, scope: [:devise, :failure], default: 'Invalid Password'))
      # render :new
    end              
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    # flash.clear
    flash.now[:notice] = ('Signed out successfully')
    yield if block_given?
    respond_to_on_destroy
  end

  private
  def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.html { head :no_content }
      format.js
      # format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end
end