class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    question
  end

  def new
    question
  end

  def edit
    question
  end

  def create
    @question = Question.new(question_params)
    return redirect_to(@question) if @question.save

    render(:new)
  end

  def update
    if question.update(question_params)
      redirect_to(@question)
    else
      render(:edit)
    end
  end

  def destroy
    question.destroy
    redirect_to(questions_path)
  end

  private

  def question
    @question ||= params['id'] ? Question.find_by(id: params['id']) : Question.new
  end

  helper_method(:question)

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
