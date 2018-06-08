# frozen_string_literal: true

# changing devise controller to respond ajax
class RegistrationsController < Devise::RegistrationsController
  respond_to :json, :js
end
