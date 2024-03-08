require 'passageidentity'
require 'net/http'

class ApplicationController < ActionController::Base
  PassageClient = Passage::Client.new(app_id: Rails.application.config.passage_app_id, api_key: Rails.application.config.passage_api_key)

  def authorize!
    begin
      @user_id = PassageClient.auth.authenticate_request(request)
    rescue Exception => e
      redirect_to "/unauthorized"
    end
  end
end
