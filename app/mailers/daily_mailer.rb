class DailyMailer < ActionMailer::Base
  default from: "info@exoworship.com"

  def send_daily_devotionals(subscriber_id)
    @day = DevotionDay.for_today.first

    @recipient = Subscriber.find(subscriber_id)
    if @day.sent_count   
      @day.sent_count += 1
    else
      @day.sent_count = 1
    end
    @day.save

    mail(:subject => "40 Days - Day #{@day.day_no}", :to => @recipient.email)
  end
end
