class AnswersController < ApplicationController
  before_action :set_question

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    if @answer.save
      respond_to do |format|
        format.html { redirect_to @question, notice: '回答が投稿されました。' }
        format.turbo_stream { render turbo_stream: turbo_stream.append('answers', partial: 'answers/answer', locals: { answer: @answer }) }
      end
    else
      render 'questions/show'
    end
  end
  
  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :image, :video)
  end
end
