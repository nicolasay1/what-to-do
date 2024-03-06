# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @group = Group.find_by_invite_token(params[:invite_token]) if params[:invite_token]
    super
  end

  # POST /resource/sign_in
  def create
    group = Group.find_by_invite_token(params[:user][:invite_token])
    Membership.where(group: group, user: current_user).first_or_create if group
    super
    if group
      set_flash_message! :notice, :joined_group, group: group.name
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
