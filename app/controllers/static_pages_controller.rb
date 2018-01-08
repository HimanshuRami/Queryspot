class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items= current_user.feed.paginate(page:params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def Books
  end

  def dev
  end

  def bus
  end


  def it
  end


  def fit
  end

  def ls
  end
end
