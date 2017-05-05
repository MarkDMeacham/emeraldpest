# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def quote
    RequestMailer.quote({name: "Mark Meacham", phone: "555-555-5555", email: "mark@mailer.demo", address: "555 Cherry Road, St. George, UT 84770", notes: "I would like a quote."})
  end
end
