class RegistrationsController < Devise::RegistrationsController
    def create
        @user = User.new(sign_up_params)
        if @user.save
          sign_in(@user) 
          redirect_to root_path, notice: 'Welcome! You have successfully signed up.'
        else
          render :new
        end
    end

    def update
      @user = current_user
      if @user.update(account_update_params)
        redirect_to root_path, notice: 'Profile updated successfully.'
      else
        render :edit
      end
    end
  
    private
  
    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :age, :weight)
    end
    
    def account_update_params
        params.require(:user).permit(:email, :first_name, :last_name, :age, :weight)
    end
  end
