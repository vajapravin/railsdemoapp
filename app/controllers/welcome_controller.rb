class WelcomeController < ApplicationController
  def index

  end
  def search
  	if params[:ajax] == "true"
	  	search_string = []
	  	search_string << "name like '%#{params[:search_keyword]}%'"
	  	search_string << "price = #{params[:search_keyword].to_i}"
	  	search_string << "author like '#{params[:search_keyword]}'"
	  	@results = Book.where(search_string.join(" or ")) rescue []
  		render :json =>  @results.map{|result| "#{result.name} @#{result.price}"}
  	else
  		search_string = []
	  	search_string << "name like '%#{params[:search_keyword][0]}%'"
	  	search_string << "price = #{params[:search_keyword][0].to_i}"
	  	search_string << "author like '#{params[:search_keyword][0]}'"
	  	@results = Book.where(search_string.join(" or ")) rescue []
  	end
  end
end