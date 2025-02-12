class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @questions = Question.all.order(created_at: :desc) # 新しい質問が先に来るように並べ替え
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @categories = Category.all
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question, notice: 'Question created successfully!'
    else
      render :new
    end
  end

  Rails.logger.debug "Categories: #{@categories.inspect}"

  private

  def question_params
    params.require(:question).permit(:title, :body, :image, :video, :category_id)
  end
end
