class ReviseAuth::EmailController < ReviseAuthController
  before_action :authenticate_user!, except: [:show]

  # GET /profile/email?confirmation_token=abcdef
  def show
    if User.find_by(confirmation_token: params[:confirmation_token])&.confirm_email_change
      # flash[:notice] = I18n.t("revise_auth.email_confirmed")
      redirect_to(user_signed_in? ? profile_path : root_path)
    else
      redirect_to root_path, alert: I18n.t("revise_auth.email_confirm_failed")
    end
  end

  def update
    email = current_user.email
    current_user.update(email_params)
    if email != params[:user][:unconfirmed_email]
      current_user.confirmation_sent_at = Time.now
      current_user.save
      current_user.send_confirmation_instructions
      # flash[:notice] = I18n.t("revise_auth.confirmation_email_sent", email: current_user.unconfirmed_email)
    end

    redirect_to profile_path
  end

  private

  def email_params
    params.require(:user).permit(:first_name, :last_name, :unconfirmed_email)
  end
end
