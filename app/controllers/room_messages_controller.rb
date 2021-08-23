class RoomMessagesController < ApplicationController
    before_action :load_entities

    def create
        @room_message = RoomMessage.create user: current_user,
                                           room: @room,
                                           message: params.dig(:room_message, :message)
      
        RoomChannel.broadcast_to @room, @room_message
        # redirect_to :back
        # redirect_to @room
        respond_to do |format|
            format.js {render inline: "location.reload();" }
          end
    end

    protected

    def load_entities
        @room = Room.find params.dig(:room_message, :room_id)
    end

end
