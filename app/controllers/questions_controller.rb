class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @questions = Question.all.order(created_at: :desc)
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
      redirect_to @question, notice: '質問が作成されました。'
    else
      render :new
    end
  end
  
  def edit
    @question = Question.find(params[:id])
    @categories = Category.all
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question, notice: '質問が更新されました。'
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :video, :category_id, :image)
  end
end
