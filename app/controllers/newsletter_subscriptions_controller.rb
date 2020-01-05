class NewsletterSubscriptionsController < ApplicationController
  def create
    newsletter_subscription = NewsletterSubscription.new(newsletter_subscription_params)

    if newsletter_subscription.save
      flash[:notice] = 'You have been subscribed! We will be in touch.'
    else
      flash[:alert] = "We could not create your subscription: #{newsletter_subscription.errors.full_messages.to_sentence}"
    end

    redirect_back(fallback_location: root_url)
  end

  private

  def newsletter_subscription_params
    params.require(:newsletter_subscription).permit(:email)
  end
end
