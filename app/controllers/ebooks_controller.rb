class EbooksController < ApplicationController
	before_action :logged_in_user,only: [:index ]
  
  def index
  	@ebooks = Ebook.all  
    @desciplines = Descipline.all
  
      respond_to do |format|
        format.html #looks for views/books/index.html.erb
        format.js   #looks for views/books/index.js.erb
      end
  end

  def new
  	@ebook = Ebook.new  
  end

  def create
  	@ebook = Ebook.new(ebook_params)

  	if @ebook.save
  		@ebook.update_attributes(descipline: @ebook.try(:descipline).try(:name)) if !@ebook.descipline.present?
  		redirect_to ebooks_path #notice: "the Ebook #{@ebook.name} has been uploaded."
  		flash[:success] = "Ebook #{@ebook.name} Saved"
  	else
  		render 'new'
  	end 
  end

  def destroy
  @ebook  = Ebook.find(params[:id])
  @ebook.destroy
  redirect_to ebooks_path #, notice:  "The Ebook #{@ebook.name} has been deleted."
  flash[:danger] = "Ebook  #{@ebook.name} Removed"
  end

  def from_ebook
    #@selected = Ebook.where(:descipline_id => params[:descipline_id])
    respond_to do |format|
        format.js
    end
end

  private

	  def ebook_params
	    params.require(:ebook).permit(:name, :attachment, :descipline_id)
	  end


	  def logged_in_user
	     unless logged_in?
	       flash[:danger] = "Please log in to view Ebooks."
	       redirect_to login_url
	     end
	  end
end
