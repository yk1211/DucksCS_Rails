class InquiryMailer < ActionMailer::Base
  default from: "DucksCS2016"
  default to: "allducks2016@gmail.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email, bcc: "allducks2016@gmail.com", :subject => "We have received your message!")
  end
end
