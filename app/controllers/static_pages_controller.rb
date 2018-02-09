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

  def compdept
    if logged_in?
      @question_ce = current_user.question_ces.build
      @post_items= current_user.post.paginate(page:params[:page])
    end
  end
  
  def itdept
  end

  def ecdept
  end

  def proddept
  end

  def civildept
  end
  
  def mechdept
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
