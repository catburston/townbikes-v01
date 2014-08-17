class UserMailer < ActionMailer::Base
  default from: "info@example.com"

  def signup_confirmation(user)
    @email    = user.email_address
    @link     = user_activation_link(user)
    @greeting = "Thank you for signing up"

    mail to: @email, subject: "Welcome!"
  end

  def inactive_tasks_warning(user, tasks)
    @email    = user.email_address
    @link     = projects_link
    @tasks    = tasks
    @greeting = "You have inactive tasks that will be deleted soon."

    mail to: @email, subject: "Inactive Tasks Warning"
  end


  private

    def user_activation_link(user)
      token     = user.confirmation_token
      base_url  = Townbikes001::Application.config.base_url
      path      = confirm_users_path

      "#{base_url}#{path}?confirmation_token=#{token}"
    end

    def projects_link
      base_url  = Townbikes001::Application.config.base_url
      path      = bicycles_path

      "#{base_url}#{path}"
    end

end
