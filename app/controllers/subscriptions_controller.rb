class SubscriptionsController < ApplicationController

  def create
    @subscriber = Subscriber.new(params[:subscriber])

    if @subscriber.save
      redirect_to days_path, :notice => 'You signed up to receive 40 Days emails!'
    else
      redirect_to days_path, :notice => 'You already signed up for 40 Days emails.'
    end

  end

  def destroy
    subscriber = Subscriber.find_by_private_code(params[:private_code])

    if subscriber
      email = subscriber.email
      subscriber.delete
      redirect_to days_path, :notice => "You will no longer receive 40 Days emails at #{email}"
    else
      redirect_to days_path
    end
  end
end
