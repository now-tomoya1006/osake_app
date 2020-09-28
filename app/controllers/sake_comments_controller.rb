class SakeCommentsController < ApplicationController
def create
    sake = Sake.find(params[:sake_id])
    comment = SakeComment.new(sake_comment_params)
    comment.user_id = current_user.id
    comment.sake_id = sake.id
    comment.save
    redirect_to sake_path(sake)
  end

  def destroy
   
     sake_comment = current_user.sake_comments.find_by(id: params[:id], sake_id: @sake.id)
     sake_comment.destroy
    redirect_to request.referer
  end
  
private
  def sake_comment_params
    params.require(:sake_comment).permit(:comment)
  end

end

