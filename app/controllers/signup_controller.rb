class SignupController < ApplicationController
  def signup
  end

  def menber
    @user = User.new
  end

  def tel
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confimation] = user_params[:password_confimation]
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
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    @user.build_residence(user_params[:residences])
    if @user.save
      sign_in(@user)
      session[:id] = @user.id
      redirect_to  new_card_path
    else
      render '/signup/signup'
    end
  end

  def done
  end

  def log_in
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confimation ,:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :phone_number, residences: [:zip_code, :prefecture_id, :city, :address, :detail])
  end
end