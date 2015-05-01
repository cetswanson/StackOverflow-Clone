class ResponsesController < ApplicationController

  def new
    if params[:question_id]
      @respondable = Question.find(params[:question_id])
    elsif params[:answer_id]
      @respondable = Answer.find(params[:answer_id])
    end

    @response = @respondable.responses.build
  end

  def create
  end

  private

  def response_params
    params.require(:response).permit(:body, :user_id, :respondable_id, :respondable_type)
  end

end