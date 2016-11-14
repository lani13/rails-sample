class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def signup(user = nil)
    user ||= {
      password:   'password',
      email:      'xxx@xxx.pl',
      birth_day:  Date.new,
      first_name: 'John',
      last_name:  'Dow'
    } unless Rails.env.production?
    @user = user

    mail to: user['email']
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot_password.subject
  #
  def forgot_password
    @greeting = 'Hi'

    mail to: 'to@example.org'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.certificate.subject
  #
  def certificate
    @greeting = 'Hi'

    mail to: 'to@example.org'
  end
end
