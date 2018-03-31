class DesciplinesController < ApplicationController

 def index
    @desciplines = Descipline.all
 end

 def show
 	 @descipline = Descipline.find(params[:id])
 	 respond_to do |format|
      format.html #looks for views/ebooks/show.html.erb
      format.js   #looks for views/ebooks/show.js.erb
    end
 end


 def book_list
 	puts "hello"
 	descipline = Descipline.find_by_id(params[:id].to_i)
 	respond_to do |format|
 		format.html {render :template => 'desciplines/book_list',layout: false ,locals: {descipline: descipline  }}
 	end
 end
end
