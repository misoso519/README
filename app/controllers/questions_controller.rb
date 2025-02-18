class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: %i[show destroy]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create_answer
    @question = Question.find(params[:id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @question, notice: '回答が投稿されました。'
    else
      render 'questions/show'
    end
  end

  def new
    @question = Question.new
    @categories = Category.all
  end

  def create
    @question = current_user.questions.build(question_params)
    @categories = Category.all

    if @question.category_id.blank?
      # カテゴリが選択されていない場合
      flash[:alert] = "カテゴリを選択してください"
      render :new and return
    end

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

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully deleted.'
  end


  private

  def question_params
    params.require(:question).permit(:title, :body, :video, :category_id, :image)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
