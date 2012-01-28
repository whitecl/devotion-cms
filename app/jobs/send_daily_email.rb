class SendDailyEmail
  @queue = 'daily_email'

  def self.perform
    p 'we did it!'
  end
end