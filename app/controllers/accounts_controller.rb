class AccountsController < ApplicationController
  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attributes(account_params)
    if @member.save
      flash[:notice_edit_account] = "Successfully updated"
      redirect_to :account
    else
      if @member.errors[:name].present?
        flash[:notice_edit_account_name] = "User name is invalid"
      end
      if @member.errors[:email].present?
        flash[:notice_edit_account_email] = "Email is invalid"
      end
      if @member.errors[:password].present?
        flash[:notice_edit_account_password] = "Password is invalid"
      end
      render "edit"
    end
  end

  private
  def account_params
    params.require(:account).permit(:name, :email, :password, :password_confirmation)
  end
end
