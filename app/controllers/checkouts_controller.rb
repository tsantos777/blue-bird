class CheckoutsController < ApplicationController
  before_action :set_checkout, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:create, :new, :confirmation]
  invisible_captcha only: [:create], honeypot: :confirm_email

  # GET /checkouts or /checkouts.json
  def index
    @checkouts = Checkout.all
  end

  # GET /checkouts/1 or /checkouts/1.json
  def show
  end

  # GET /checkouts/new
  def new
    @checkout = Checkout.new
  end

  # GET /checkouts/1/edit
  def edit
  end

  # POST /checkouts or /checkouts.json
  def create
    @checkout = Checkout.new(checkout_params)

    respond_to do |format|
      if @checkout.save
        CheckoutEmailMailer.checkout_email(@checkout).deliver_later
        format.html { redirect_to checkout_confirmation_path, notice: "#{@checkout.first_name}" }
        #format.json { render :show, status: :created, location: @checkout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkouts/1 or /checkouts/1.json
  #def update
  #  respond_to do |format|
  #    if @checkout.update(checkout_params)
  #      format.html { redirect_to checkout_url(@checkout), notice: "Checkout was successfully updated." }
  #      format.json { render :show, status: :ok, location: @checkout }
  #    else
  #      format.html { render :edit, status: :unprocessable_entity }
  #      format.json { render json: @checkout.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /checkouts/1 or /checkouts/1.json
  def destroy
    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to checkouts_url, notice: "Checkout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkout_params
      params.require(:checkout).permit(:first_name, :last_name, :email, :phone, :certifications, :interested_aircraft, :preferred_date, :preferred_availability, :alternate_date, :alternate_availability, :comments)
    end
end
