class DailyMailer < ActionMailer::Base
  default from: "devotions@exoworship.com"

  def send_daily_devotionals
    @day = DevotionDay.for_today.first

    recipients = Subscriber.all
    @day.sent_count = recipients.count
    @day.save

    mail(:subject => "40 Days - Day #{@day.day_no}", :bcc => recipients.map(&:email))
  end
end
