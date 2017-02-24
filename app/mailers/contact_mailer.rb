class ContactMailer < ApplicationMailer
  def email_owner(customer, yacht, message, owner)
    @customer = customer
    @yacht    = yacht
    @message  = message
    @owner    = owner
    mail(to: yacht.user.email,
         subject: "Question about your boat #{yacht.name}")
    # This will render a view in `app/views/user_mailer`!
  end
end
