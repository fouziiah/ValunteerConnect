class ApiController < ApplicationController
  def send_text
    opportunity = CreateOpportunity.find(params[:opportunity_id])
    user_phone_number = opportunity.user.phone

    user_message = Twilio::REST::Client.new.messages.create(
      from: '+18886819261',
      body: "Thanks for expressing interest in #{opportunity.title}. Will reach out to you soon!",
      to: user_phone_number
    )
  end
end
