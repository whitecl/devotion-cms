class SendDailyEmail
  @queue = 'daily_email'

  def self.perform
    devotion_day = DevotionDay.for_today.first

    # Is one even going out today?
    return unless devotion_day

    Subscriber.all.each do |subscriber|
      DailyMailer.send_daily_devotionals(subscriber.id).deliver
    end
  end
end