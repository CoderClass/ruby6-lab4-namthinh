class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      flash[:error] = @message.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def new

  end

  def show
    @message = Message.find(:id)
  end

  private
  def message_params
    params.require(:message).permit(:content, :username)
  end
end
