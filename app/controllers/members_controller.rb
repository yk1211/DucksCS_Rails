class MembersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @member = Member.new
  end

  #New member sign up with strong parameters
  #success -> posts, index
  #failure -> new member signup view again
  def create
    @member = Member.new(member_params)
    if @member.save
      member = Member.authenticate(@member.name, @member.password)
      if member
       session[:member_id] = member.id
      end
      flash[:notice_signup] = "Registration Successful"
      redirect_to :posts
    else
        if @member.errors[:name].present?
          flash[:notice_name] = "User name is invalid"
        end
        if @member.errors[:email].present?
          flash[:notice_email] = "Email is invalid"
        end
        if @member.errors[:password].present?
          flash[:notice_password] = "Password is invalid"
        end
        redirect_to :new_member
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  #Strong pameters setting
  private
  def member_params
    attrs = [:name, :email, :password, :password_confirmation]
    params.require(:member).permit(attrs)
  end

end
