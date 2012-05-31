class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
  
  # Protect these actions behind an admin login
  # before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
  before_filter :find_user, :only => [:suspend, :unsuspend, :destroy, :purge]
  

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.register! if @user.valid?
    if @user.errors.empty?
      #self.current_user = @user
      #redirect_back_or_default('/')
      flash[:notice] = "Gracias por Registrarse!"
    else
      render :action => 'new'
    end
  end
   #change password
      def change_password
      return unless request.post?
      if User.authenticate(current_user.login, params[:old_password])
        if ((params[:password] == params[:password_confirmation]) && 
                              !params[:password_confirmation].blank?)
          current_user.password_confirmation = params[:password_confirmation]
          current_user.password = params[:password]

          if current_user.save
            flash[:notice] = "Password successfully updated" 
            redirect_to profile_url(current_user.login)
          else
            flash[:alert] = "Password not changed" 
          end

        else
          flash[:alert] = "New Password mismatch" 
          @old_password = params[:old_password]
        end
      else
        flash[:alert] = "Old password incorrect" 
      end
    end

    #gain email address
    def forgot_password
      return unless request.post?
      if @user = User.find_by_email(params[:user][:email])
        @user.forgot_password
        @user.save
        redirect_back_or_default('/')
        flash[:notice] = "se ha enviado a tu direcci&oacute;n de correo electr&oacute;nico un link para cambiar la contrase&ntilde;a" 
      else
        flash[:alert] = "No se pudo encontrar un usuario con esa direcci&iacute;n de correo electr&oacute;nico" 
      end
    end

    #reset password
    def reset_password
      @user = User.find_by_password_reset_code(params[:id])
      return if @user unless params[:user]

      if ((params[:user][:password] && params[:user][:password_confirmation]) && 
                              !params[:user][:password_confirmation].blank?)
        self.current_user = @user #for the next two lines to work
        current_user.password_confirmation = params[:user][:password_confirmation]
        current_user.password = params[:user][:password]
        @user.reset_password
        flash[:notice] = current_user.save ? "Password reset success." : "Password reset failed." 
        redirect_back_or_default('/')
      else
        flash[:alert] = "Password mismatch" 
      end  
    end
  
  
  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate!
      flash[:notice] = ""
    end
    redirect_back_or_default('/')
  end

  def suspend
    @user.suspend! 
    redirect_to users_path
  end

  def unsuspend
    @user.unsuspend! 
    redirect_to users_path
  end

  def destroy
    @user.delete!
    redirect_to users_path
  end

  def purge
    @user.destroy
    redirect_to users_path
  end

protected
  def find_user
    @user = User.find(params[:id])
  end

end
