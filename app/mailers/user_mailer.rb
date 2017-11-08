class UserMailer < ApplicationMailer
  default from: "admin@bb.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'jayhatens@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end