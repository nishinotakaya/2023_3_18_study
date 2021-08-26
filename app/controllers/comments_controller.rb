class CommentsController < ApplicationController
  def create
    comment = Comment.new(commnt_params)
    if comment.save
      flash[:notice] = 'コメントを作成しました'
      redirect_to comment.board #board_idに紐づくboardオブジェクトを自然にしてくれる
    else
      redirect_to board_url(comment.board), flash: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end 
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash: { notice: 'コメントが削除されました' }
  end

  private
  def commnt_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
