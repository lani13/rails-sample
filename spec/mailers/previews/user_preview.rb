# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/signup
  def signup
    UserMailer.signup
  end

  # Preview this email at http://localhost:3000/rails/mailers/user/forgot_password
  def forgot_password
    UserMailer.forgot_password
  end

  # Preview this email at http://localhost:3000/rails/mailers/user/certificate
  def certificate
    UserMailer.certificate
  end

end
