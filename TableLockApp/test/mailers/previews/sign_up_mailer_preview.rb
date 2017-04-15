# Preview all emails at http://localhost:3000/rails/mailers/sign_up_mailer
class SignUpMailerPreview < ActionMailer::Preview
  def welcome_mail_preview
    SignUpMailer.welcome_email(User.find(3))

  end

end
