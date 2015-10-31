class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def create
    super
    if @user.save
      @user.add_role params[:role]
    end
  end

  def new
    super
  end

  def edit
    super
  end
end
