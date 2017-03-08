class RoomsController < ApplicationController
  def index
    @rooms = Room.all
		@room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
			flash[:error] = @room.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def show
    redirect_to room_messages_path(@room)
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
