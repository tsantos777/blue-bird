class DiscoverFlightsController < ApplicationController
  before_action :set_discover_flight, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:create, :new, :confirmation]
  invisible_captcha only: [:create], honeypot: :confirm_email

  # GET /discover_flights or /discover_flights.json
  def index
    @discover_flights = DiscoverFlight.all
  end

  # GET /discover_flights/1 or /discover_flights/1.json
  def show
  end

  # GET /discover_flights/new
  def new
    @discover_flight = DiscoverFlight.new
  end

  # GET /discover_flights/1/edit
  def edit
  end

  # POST /discover_flights or /discover_flights.json
  def create
    @discover_flight = DiscoverFlight.new(discover_flight_params)

    respond_to do |format|
      if @discover_flight.save
        #DiscoverFlightsMailer.discover_flights_email(@discover_flight).deliver_later
        format.html { redirect_to discovery_confirmation_path, notice: "#{@discover_flight.first_name}" }
        format.json { render :show, status: :created, location: @discover_flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discover_flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discover_flights/1 or /discover_flights/1.json
  #def update
  #  respond_to do |format|
  #    if @discover_flight.update(discover_flight_params)
  #      format.html { redirect_to discover_flight_url(@discover_flight), notice: "Discover flight was successfully updated." }
  #      format.json { render :show, status: :ok, location: @discover_flight }
  #    else
  #      format.html { render :edit, status: :unprocessable_entity }
  #      format.json { render json: @discover_flight.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /discover_flights/1 or /discover_flights/1.json
  def destroy
    @discover_flight.destroy

    respond_to do |format|
      format.html { redirect_to discover_flights_url, notice: "Discover flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discover_flight
      @discover_flight = DiscoverFlight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discover_flight_params
      params.require(:discover_flight).permit(:first_name, :last_name, :email, :phone, :aircraft, :preferred_date, :preferred_availability, :alternate_date, :alternate_availability, :comments)
    end
end
