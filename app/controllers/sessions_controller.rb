class SessionsController < ApplicationController
  def login
  end

  def create
    if params[:name] == ""
      flash[:notice_name] = "Your user name is required."
    end
    if params[:password] == ""
      flash[:notice_password] = "Your password is required."
    end

    member = Member.authenticate(params[:name], params[:password])
    if member
     session[:member_id] = member.id
     redirect_to :posts
    else
     flash[:notice_unmatch] = "The User name and password unmatch."
     redirect_to :login
    end

  end

  def destroy
    session.delete(:member_id)
    redirect_to :root
  end

end
