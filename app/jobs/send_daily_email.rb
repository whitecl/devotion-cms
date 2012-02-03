class SendDailyEmail
  @queue = 'daily_email'

  def self.perform
    DailyMailer.send_daily_devotionals.deliver
  end
end