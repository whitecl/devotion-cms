class DailyMailer < ActionMailer::Base
  default from: "40days <info@exoworship.com>"
  helper :application

  def send_daily_devotionals(subscriber_id)
    @day = DevotionDay.for_today.first

    @recipient = Subscriber.find(subscriber_id)
    if @day.sent_count   
      @day.sent_count += 1
    else
      @day.sent_count = 1
    end
    @day.save

    mail(:subject => "#{@day.season.title} - Day #{@day.day_no}", :to => @recipient.email)
  end
end
