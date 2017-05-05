class RequestMailer < ApplicationMailer
  def quote(request)
    @request = request
    mail(to: "mark_meacham@hotmail.com", subject: "Quote Request")
  end
end
