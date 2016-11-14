class AccountController < ApplicationController
  layout 'registered'

  def index
    @courses = Course.all
  end

  def new
    @user = User.new
  end

  def create
    params = user_params
    params['password'] = params['password_confirmation'] = User.generate_random_string
    @user = User.new(params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        UserMailer.signup(params).deliver_now # @TODO consider Active Job
        format.html { redirect_to account_index_path, success: t('user.created') }
      else
        format.html { render :new }
      end
    end
  end

  def reset_password
  end

  def course
  end

  def certificate

  end

  def login
    if user_params.present?
      user = User.find_by_email(user_params[:email])

      if user && user.authenticate(user_params[:password])
        session[:user_id] = user.id
        redirect_to account_index_path, success: t('user.logged_in')
      else
        redirect_to account_login_path, alert: t('.wrong_email_or_password')
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, success: t('user.logged_out')
  end

  private

  def user_params
    if params[:user]
      params.require(:user).permit(:first_name, :last_name, :birth_day, :email, :password, :password_confirmation)
    end
  end
end
