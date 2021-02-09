class DailyMailer < ApplicationMailer
  default from: 'no-reply@gmail.com'
  
  def daily_mail(user)
    @user = user
    mail(subject: "Its a daily mail",
              to: @user.email)
  end
  
end

