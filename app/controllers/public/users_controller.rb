class Public::UsersController < ApplicationController
  def show
    @user=User.find(params[:user_id])
    @following_user=current_user.relationships.find_by(follow_id: @user.user_id)
    @relationship=Relationship.new
    @followers=Relationship.where(follow_id: @user.user_id)
    @posts=@user.posts.all
  end

  def edit
    @user=User.find_by(user_id: current_user.user_id)
  end

  def update
    user=User.find_by(user_id: current_user.user_id)
    user.update(user_params)
    if params[:frame_type_analysis]
      redirect_to face_type_analysis_user_path(current_user.user_id)
    else
      redirect_to user_path(user)
    end
  end

  def favorites
  end

  def following
  end

  def followers
  end

  def comments
  end

  def welcome
    @user=User.find_by(user_id: current_user.user_id)
  end

  def frame_type_analysis
    @frame_questions=FrameQuestion.all
  end

  def frame_type_result
    @user=User.find_by(user_id: current_user.user_id)
    @frame_questions=FrameQuestion.all
    answers=@frame_questions.map{|q|  params[:"#{q.id}"] }
    a=answers.count("A")
    b=answers.count("B")
    c=answers.count("C")
    if a>b&&a>c
      @result=User.frame_types.key(0)
      @result_ja=User.frame_types_i18n[:strate]
    elsif b>a&&b>c
      @result=User.frame_types.key(1)
      @result_ja=User.frame_types_i18n[:wave]
    elsif c>a&&c>b
      @result=User.frame_types.key(2)
      @result_ja=User.frame_types_i18n[:natural]
    end
  end

  def face_type_analysis
    @face_questions=FaceQuestion.all
  end

  def face_type_result
    @user=User.find_by(user_id: current_user.user_id)
    @face_questions=FaceQuestion.all
    answers=@face_questions.map{|q|  [q.id, params[:"#{q.id}"]] }
    question_ans=Hash[answers]
    only_ans=@face_questions.map{|q|  params[:"#{q.id}"] }
    child=only_ans.count("子ども")
    adult=only_ans.count("大人")
    curve=only_ans.count("曲線")
    straight=only_ans.count("直線")
    question=FaceQuestion.find_by(title: "目の印象は")
    eye_size=question_ans.fetch(question.id)
    if child>adult && curve>=7 && eye_size=="曲線"
      @result=User.face_types.key(0)
      @result_ja=User.face_types_i18n[:cute]
    elsif child>adult&& curve>=7 && eye_size=="直線"
      @result=User.face_types.key(1)
      @result_ja=User.face_types_i18n[:active_cute]
    elsif child>adult && straight>=2 && straight<=6
      @result=User.face_types.key(2)
      @result_ja=User.face_types_i18n[:flesh]
    elsif child>adult && straight>=7
      @result=User.face_types.key(3)
      @result_ja=User.face_types_i18n[:cool_casual]
    elsif adult>child && curve>=7
      @result=User.face_types.key(4)
      @result_ja=User.face_types_i18n[:feminin]
    elsif adult>child && straight>=2 && straight<=6 && eye_size=="曲線"
      @result=User.face_types.key(5)
      @result_ja=User.face_types_i18n[:soft_elegant]
    elsif adult>child && straight>=2 && straight<=6 && eye_size=="直線"
      @result=User.face_types.key(6)
      @result_ja=User.face_types_i18n[:elegant]
    elsif adult>child && straight>=7
      @result=User.face_types.key(7)
      @result_ja=User.face_types_i18n[:cool]
    end
  end

  def unsubscribe
  end





  private

  def user_params
    params.require(:user).permit(:user_id, :user_name, :email, :password, :face_type, :frame_type, :stature, :introduction)
  end
end
