class SakeCommentsController < ApplicationController
def create
    @sake = Sake.find(params[:sake_id])
    @sake_comment = current_user.sake_comments.new(sake_comment_params)
    @sake_comment.sake_id = @sake.id
    if @sake_comment.save
      flash[:success] = "Comment was successfully created."
    end
    redirect_to request.referer
  end

  def destroy
  @sake = Sake.find(params[:sake_id])
    sake_comment = current_user.sake_comments.find_by(id: params[:id], sake_id: @sake.id)
    sake_comment.destroy
    redirect_to request.referer
  end
  
private
  def sake_comment_params
    params.require(:sake_comment).permit(:comment)
  end

end

