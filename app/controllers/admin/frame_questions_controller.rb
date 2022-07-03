class Admin::FrameQuestionsController < ApplicationController
  def edit
  end

  def index
    @frame_question=FrameQuestion.new
    @frame_questions=FrameQuestion.all
  end

  def create
    @frame_question=FrameQuestion.new(frame_question_params)
    if @frame_question.save
      redirect_to admin_frame_questions_path
    else
      @frame_questions=FrameQuestion.all
      render :index
    end
  end

  def destroy
    @frame_question=FrameQuestion.find(params[:id])
    @frame_question.destroy
    redirect_to admin_frame_questions_path
  end



  private
  def frame_question_params
    params.require(:frame_question).permit(:title, :strate, :wave, :natural)
  end
end
