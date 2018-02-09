class UsersController < ApplicationController
  	
  	  before_action :logged_in_user,only: [:index ,:edit, :update, :destroy,:following, :followers]
  	  before_action :correct_user,  only: [:edit, :update]
		  before_action :admin_user,    only: [:destroy]
    
    def index
      @users = User.paginate(page: params[:page])
    end
    
    
     
    
		def show
			@user =User.find(params[:id])
      @microposts = @user.microposts.paginate(page: params[:page])
      @question_ces = @user.question_ces.paginate(page: params[:page])  
			# debugger
		end
  	
  	def new
  		@user=User.new
  	end

    def edit
      @user = User.find(params[:id])
    end
  	
  	def create
      #binding.pry
  		@user=User.new(user_params) 
  		if @user.save
       UserMailer.account_activation(@user).deliver_now
        #@user.send_activation_email
        #UserMailer.welcome_email(@user).deliver_now
        #log_in @user
        flash[:info] = "Please check your email to activate your account."
  			#flash[:success] = "Welcome to the Sample App!"
  			#redirect_to @user #Handle successful save
        redirect_to root_url
  		else
  			render 'new'	
  		end
  	end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Your Profile updated successfully"
        redirect_to @user
        else
          render 'edit'
          end
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    end

    def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def subscribe_user
    # binding.pry
    @topics = Topic.all
  end
  def create_subscribe_user
    binding.pry
  end



  	private 

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, topic_ids: [])
  	end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    


    # Confirm a correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end