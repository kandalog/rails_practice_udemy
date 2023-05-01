class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity # 422
    end
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  # 質問更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # 質問削除
  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

  private
    def question_params
      # require(データのobj名),permit(許可する値)
      params.require(:question).permit(:title, :name, :content)
    end
end
