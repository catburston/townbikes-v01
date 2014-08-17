class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email_address(session_params[:email_address])

    if user && user.confirmed && user.authenticate(session_params[:password])
      set_session(user)
      redirect_to bicycles_path, notice: "Welcome back!"

    elsif user && !user.confirmed     # User has not confirmed his account yet and can not log in (customer support has to handle typos in emails on signup)
      user.update_attributes!(confirmation_token: SecureRandom.urlsafe_base64(24))   # we create a new token
      UserMailer.signup_confirmation(user).deliver                 # before sending a new confirmation email
      flash[:notice] = "You have to confirm your email to activate your account, please check your inbox"
      render :new

    else
      # we could count the failed login attempts to either block the account for some time
      # or to insert an artifical, growing delay - this helps agains automated bruce force attacks
      flash[:notice] = I18n.t("error.email_address")
      render :new
    end
  end

  def destroy
    current_user.update_attributes(session_token: nil)
    session[:token] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private

    def session_params
      params.permit(:email_address, :password)
    end
end
