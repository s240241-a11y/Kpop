class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    # DM相手のエントリー一覧を取得
    @entries = Entry.where(user_id: current_user.id).includes(:user, :room)
    # 初期化
    @messages = []
    @isRoom = false
    @roomId = nil
    @message = Message.new  # 新規メッセージ用
    if @user.id == current_user.id
      @msg = "他のユーザーとDMしてみよう！"
    else
      # 共通のルームを探す
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
            break
          end
        end
        break if @isRoom
      end
      if @isRoom
        # ルームが存在する場合
        @messages = Message.where(room_id: @roomId).includes(:user).order(created_at: :asc)
      else
        # ルームが存在しない場合
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end 







