class ContactMailer < ApplicationMailer
  def email_owner( user, data)
    @user = user  # Instance variable => available in view

    mail(to: @user.email,
         subject: 'Question about your boat')
    # This will render a view in `app/views/user_mailer`!
  end


end
