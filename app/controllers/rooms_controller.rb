class RoomsController < ApplicationController
    # Loads:
    # @rooms = all rooms
    # @room = current room when applicable
    before_action :authenticate_user!
    before_action :load_entities
  
    
    def index
        @room = Room.all.where('creator_id', current_user.id)
        if @room.empty?
            @room = Room.all.where('recipient_id', current_user.id)
        end
    end
  
    def new
        if params[:first_name]
          @rooms = Room.all#.where('creator_id', current_user.id)
          @rooms.each do |room|
            if current_user.id == room.creator_id and params[:user_id].to_i == room.recipient_id
              @room = room
            elsif current_user.id == room.recipient_id and params[:user_id].to_i == room.creator_id
              @room = room
            else
              @room = nil
            end

          end

        
          if @room.nil?
              @room = Room.new
              @room.name = 'Chat'
              @room.creator_id = current_user.id
              @room.recipient_id = params[:user_id].to_i
              recipient_name = params[:first_name] + ' ' + params[:second_name]
              creator_name = current_user.first_name + ' ' + current_user.second_name
              @room.creator_name = creator_name
              @room.recipient_name = recipient_name

              if @room.save
                  flash[:success] = "Room #{@room.name} was created successfully"
                  redirect_to @room
              else
                  redirect_to root_url
              end
          else
              redirect_to @room
              # if params[:first_name]
              # end
          end
        else
          redirect_to root_url
        end
    end
  
    def create
      @room = Room.new permitted_parameters
  
      if @room.save
        flash[:success] = "Room #{@room.name} was created successfully"
        redirect_to rooms_path
      else
        render :new
      end
    end
    
    def show
        if [@room.creator_id, @room.recipient_id].include? current_user.id
            @room_message = RoomMessage.new room: @room
            @room_messages = @room.room_messages.includes(:user)
        else
            flash[:failure] = "You have no access to this room"
            redirect_to root_url
        end
    end

    def edit
    end
  
    def update
      if @room.update_attributes(permitted_parameters)
        flash[:success] = "Room #{@room.name} was updated successfully"
        redirect_to rooms_path
      else
        render :new
      end
    end
  
    protected
  
    def load_entities
      @rooms = Room.all
      @room = Room.find(params[:id]) if params[:id]
    end
  
    def permitted_parameters
      params.require(:room).permit(
          :name,
          :creator_id,
          :recipient_id,
          :creator_name,
          :recipient_name
          )
    end
  end