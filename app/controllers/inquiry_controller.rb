class InquiryController < ApplicationController
  def index
    #input view
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.valid?
      #OK
      render :action => 'confirm'
    else
      #NG
      render :action => 'index'
    end
  end

  def thanks
    #Sending email
    @inquiry = Inquiry.new(params[:inquiry])
    InquiryMailer.received_email(@inquiry).deliver

    #Display inquiry is completed
    render :action => 'thanks'
  end
end
