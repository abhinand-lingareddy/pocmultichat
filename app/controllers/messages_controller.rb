class MessagesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def index
    @chat = Chat.find(params[:chat_id])
    @messages = @chat.messages
    @new_message = @chat.messages.build
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)

    if @message.save
      sync_new @message , scope: Message.by_chat(@chat)
    end

    respond_with { @message }
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end