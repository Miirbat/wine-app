class Api::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :destroy, :update]

  def index
    render json: Account.all
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      render json: @account
    else
      render json: { status: "error", message: "Bad data." }, status: 400
    end
  end

  def login
    @account = Account.find_by(email: params[:email])
    if(@account && @account.authenticate(params[:password]))
      render json: @account
    else
      render json: { status: "error", message: "Failed to login. Username or Password incorrect!" },  status: 404
    end
  end

  def show
    render json: { account: @account }
  end

  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: { message: @account.errors }, status: 400
    end
  end

  def destroy
    if @account.destroy
      render status: 204
    else
      render json: { message: "Unable to delete this account." }, status: 400
    end
  end

  private

    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    
end
