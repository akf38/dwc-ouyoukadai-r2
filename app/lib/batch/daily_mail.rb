class Batch::DailyMail
  def self.daily_mail
    @users = User.all
    @users.each do |user|
      DailyMailer.daily_mail(user).deliver_now
    end
    p "デイリーメールの送信が完了しました。"
  end
end