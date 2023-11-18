class BoardsController < ApplicationController
before_action :set_target_board, only: %i[show edit update destroy]

  def index
    @boards = Board.all.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @boards }
    end
  end


  def show
    @comment = Comment.new(board_id: @board.id)
    respond_to do |format|
      format.html
      format.json { render json: @board }
    end
  end

  def create
    board = Board.new(boards_params)
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board #ストロングパラメーターがcreateされてidが作成されているため  
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(board_id: @board.id) #書き直し@boardに紐づいたコメントに影響しない
    respond_to do |format|
      format.html
      format.json { render json: @board }
    end
  end

  def edit
  end

  def update
    if @board.update(boards_params)
      flash[:notice] = "「#{@board.title}」の掲示板を編集しました"
      redirect_to @board
    else
      redirect_to edit_board_path, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end  
  end

  def destroy
    @board.destroy
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました"}
  end

private

  def set_target_board
    @board = Board.find(params[:id])
  end  

  def boards_params
    params.require(:board).permit(:name, :title, :body, tag_ids: []).merge(user_id: current_user.id)
  end  
end
