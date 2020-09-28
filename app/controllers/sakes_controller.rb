class SakesController < ApplicationController
   before_action :authenticate_user!
   
   def show
         @sake = Sake.find(params[:id])
         @user = @sake.user
         @sake_new = Sake.new
       @sake_comment = SakeComment.new
       @sake_comments = @sake.sake_comments
   end

   def index
      @sakes = Sake.all
      @sake = Sake.new
      
  end
  

  def create
     @sake = Sake.new(sake_params)
     @sake.user_id = current_user.id
      if @sake.save
         flash[:success] = "You have creatad sake successfully."
         redirect_to sake_path(@sake)
       else 
        flash[:danger] = @sake.errors.full_messages
         @sakes = Sake.all
         render action: :index
       end
  end


   

  def edit
      @sake = Sake.find(params[:id])
       if current_user.id != @sake.user_id
      redirect_to sakes_path
    end

  end

  def update
      @sake = Sake.find(params[:id])
      if @sake.update(sake_params)
         flash[:success] = "You have updated sake successfully."
          redirect_to sake_path(@sake)
      else 
        flash[:danger] = @sake.errors.full_messages
         render action: :edit
       end
   end
 

  def destroy
      @sake = Sake.find(params[:id])
      @sake.destroy
      redirect_to sakes_path
  end

  private
  def sake_params
      params.require(:sake).permit(:title, :body, :image)
  end

 

end

