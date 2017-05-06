class RequestMailer < ApplicationMailer
  def quote(request)
    @request = request
    mail(to: "emeraldpest@gmail.com", subject: "Quote Request")
  end
end
