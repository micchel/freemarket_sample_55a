class SignupController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def tel
    session[:nickname] = user_params[:nickname],
    session[:mail] = user_params[:mail],
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = user_params["birthday(1i)"] + "-" +  user_params["birthday(2i)"] + "-" + user_params["birthday(3i)"]
    @user = User.new
  end

  def address
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_residence
  end


  def create
    @user = Uer.new(
      nickname:             session[:nickname],
      mail:                 session[:mail],
      password:             session[:password],
      password_confimation: session[:password_confirmation],
      last_name:            session[:last_name],
      first_name:           session[:first_name],
      last_name_kana:       session[:last_name_kana],
      first_name_kana:      sisson[:first_name_kana],
      birthday:             session[:birthday],
      pohone_number:        sisson[:pohone_number]
    )
    @user.build_residence(user_params[:residence])
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_path
    else
      render '/singup/index'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation ,:nickname, :name_kanji, :name_kana, :birthday, :phone_number, residences: [:zip_code, :prefecture_id, :city, :address, :detail])
  end
end