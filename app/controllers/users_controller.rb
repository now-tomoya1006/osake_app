class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @sakes = @user.sakes
    @sake= Sake.new
  end
  
  def index
    @users = User.all
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
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  	
  end

  def update
    if current_user
       @user = User.find(params[:id])
       if @user.update(user_params)
       	flash[:success] = "You have updated user successfully."
          redirect_to user_path(@user.id)
         else
          flash[:danger] = @user.errors.full_messages
          render "edit"
       end
     else
    end
   end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :image, :type )
  end

 
    end


