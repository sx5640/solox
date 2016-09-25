class SessionsController < ApplicationController
  skip_before_action :require_login, :only => %i(create new)
  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(current_user, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end

  def new
    @user = User.new
  end
end
