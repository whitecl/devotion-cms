class SendDailyEmail
  @queue = 'daily_email'

  def self.perform
    devotion_day = DevotionDay.for_today.first

    # Is one even going out today?
    return unless devotion_day

    Subscriber.all.each do |subscriber|
      # last minute email validity check
      if subscriber.email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
        DailyMailer.send_daily_devotionals(subscriber.id).deliver
      end
    end
  end
end