class SearchController < ApplicationController
  def index
    @results = Question.where('title LIKE ?', "%#{params[:query]}%")
  end
end
