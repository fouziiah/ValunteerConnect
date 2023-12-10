# frozen_string_literal: true

require 'rubygems'
require 'twilio-ruby'
class ApiController < ApplicationController
  def send_text
    opportunity = CreateOpportunity.find(params[:opportunity_id])
    # opportunity = CreateOpportunity.first
    user_phone_number = current_user.phone

    ENV['TWILIO_ACCOUNT_SID']
    ENV['TWILIO_AUTH_TOKEN']

    account_sid = 'AC86e172d511df76fc4376373064b4ac04'
    auth_token = '188e87f07f5ead138a983d9762f89959'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    user_message = @client.messages.create(
      from: '+18886819261',
      body: "Thanks for expressing interest in #{opportunity.title}. Will reach out to you soon!",
      to: user_phone_number
    )
    puts '........................................'
    puts user_message.sid
    puts opportunity.title

    # account_sid = 'AC86e172d511df76fc4376373064b4ac04'
    # auth_token = '188e87f07f5ead138a983d9762f89959'
    # @client = Twilio::REST::Client.new(account_sid, auth_token)

    # message = @client.messages.create(
    #   body: 'Hello from Twilio',
    #   from: '+18886819261',
    #   to: '+18777804236'
    # )

    # puts '........................................'
    # puts message

    # redirect_to opportunity, notice: 'Thanks for expressing interest!'
  end
end
