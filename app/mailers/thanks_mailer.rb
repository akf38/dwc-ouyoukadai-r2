class ThanksMailer < ApplicationMailer
  default from: 'no-reply@gmail.com'
  
  def thanks_mail(user)
    @user = user
    @url ="https://4112eddcd31c4ebd998e2d71b38ad707.vfs.cloud9.ap-northeast-1.amazonaws.com/users/#{@user.id}"
    mail(subject: "Thank you for signing up",
              to: @user.email)
  end
end
