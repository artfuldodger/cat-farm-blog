class NewsletterSubscription < ApplicationRecord
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
