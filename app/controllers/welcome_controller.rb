class WelcomeController < ApplicationController
  def index

  end
  def search
  	@results = Book.where("name like '%#{params[:search_keyword][0]}%'") rescue []
  end
end
