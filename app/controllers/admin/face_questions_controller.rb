class Admin::FaceQuestionsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @face_question=FaceQuestion.find(params[:id])
  end

  def update
    face_question=FaceQuestion.find(params[:id])
    if face_question.update(face_question_params)
      redirect_to admin_face_questions_path
    else
      render :edit
    end
  end

  def index
    @face_question=FaceQuestion.new
    @face_questions=FaceQuestion.all
  end

  def create
    @face_question=FaceQuestion.new(face_question_params)
    if @face_question.save
      redirect_to admin_face_questions_path
    else
      @face_questions=FaceQuestion.all
      render :index
    end
  end

  def destroy
    @face_question=FaceQuestion.find(params[:id])
    @face_question.destroy
    redirect_to admin_face_questions_path
  end



  private
  def face_question_params
    params.require(:face_question).permit(:title, :answer_1, :answer_2, :generation_or_shape)
  end
end