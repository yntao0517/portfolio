class ChatsController < ApplicationController
  def chatroom
    if logged_in?
      @hospital = Hospital.find(params[:id])
      @user = User.find(current_user)
      @hospital_name = @hospital.name
      @user_name = @user.name
    else
      @hospital = Hospital.find(current_hospital)
      @user = User.find(params[:id])
      @hospital_name = @hospital.name
      @user_name = @user.name
    end
    @chats = Chat.where(hospital_id: @hospital.id, user_id: @user.id).order("id asc").all
  end

  def new
    Chat.create(hosptal_id: params[:hospital_id],
                user_id: params[:user_id],
                body: params[:body])
    if logged_in?
      id = params[:hospital_id]
    else
      id = params[:user_id]
    end
    redirect_to "/chatroom/#{id}"
  end
end
