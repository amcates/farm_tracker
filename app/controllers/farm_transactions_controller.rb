class FarmTransactionsController < ApplicationController
  before_action :authorize!, except: :unauthorized
  before_action :set_farm_transaction, only: %i[ show edit update destroy ]

  def authorized
    user = PassageClient.user.get(user_id: @user_id)
    username = user.email
    username = user.phone if user.email.nil? || user.email.empty?
    @user = username
  end

  def unauthorized
  end

  # GET /farm_transactions or /farm_transactions.json
  def index
    @farm_transactions = FarmTransaction.all
  end

  # GET /farm_transactions/1 or /farm_transactions/1.json
  def show
  end

  # GET /farm_transactions/new
  def new
    @farm_transaction = FarmTransaction.new
  end

  # GET /farm_transactions/1/edit
  def edit
  end

  # POST /farm_transactions or /farm_transactions.json
  def create
    @farm_transaction = FarmTransaction.new(farm_transaction_params)

    respond_to do |format|
      if @farm_transaction.save
        format.html { redirect_to farm_transactions_url, notice: "Farm transaction was successfully created." }
        format.json { render :show, status: :created, location: @farm_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @farm_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farm_transactions/1 or /farm_transactions/1.json
  def update
    respond_to do |format|
      if @farm_transaction.update(farm_transaction_params)
        format.html { redirect_to farm_transactions_url, notice: "Farm transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @farm_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @farm_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farm_transactions/1 or /farm_transactions/1.json
  def destroy
    @farm_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to farm_transactions_url, notice: "Farm transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_transaction
      @farm_transaction = FarmTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def farm_transaction_params
      params.require(:farm_transaction).permit(:transaction_type, :animal, :item_name, :description, :amount, :happened_on)
    end
end
