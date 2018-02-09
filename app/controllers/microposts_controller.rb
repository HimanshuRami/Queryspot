class MicropostsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def create
    
    @micropost = current_user.microposts.build(micropost_params)
    
    if @micropost.save  
      flash[:success] = "Microtale created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
   

  def destroy
    @micropost.destroy
    flash[:success] = "Microtale deleted"
    redirect_to request.referrer || root_url
  end

  def upvote 
    @micropost = Micropost.find(params[:id])
    @micropost.upvote_by current_user
    redirect_back fallback_location: root_path
  end  

  def downvote
    @micropost = Micropost.find(params[:id])
    @micropost.downvote_by current_user
    redirect_back fallback_location: root_path 
  end

 private

  def micropost_params
    params.require(:micropost).permit(:content, :picture, :comment => [:body, :user_id, :micropost_id])
  end

  def correct_user
    @micropost = Micropost.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

end