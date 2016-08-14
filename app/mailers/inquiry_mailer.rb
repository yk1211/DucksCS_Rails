class InquiryMailer < ActionMailer::Base
  default from: "DucksCS2016@example.com"
  default to: "allducks2016@gmail.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => "We have received your messaage!")
  end
end
