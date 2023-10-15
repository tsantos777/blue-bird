class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:create, :new, :confirmation]
  invisible_captcha only: [:create], honeypot: :confirm_email

  # GET /enrollments or /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  def confirmation
  end

  # GET /enrollments/1 or /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments or /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        EnrollmentMailer.enrollment_email(@enrollment).deliver_later
        format.html { redirect_to enroll_confirmation_path, notice: @enrollment.first_name }
        #format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  ## PATCH/PUT /enrollments/1 or /enrollments/1.json
  #def update
  #  respond_to do |format|
  #    if @enrollment.update(enrollment_params)
  #      format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully updated." }
  #      format.json { render :show, status: :ok, location: @enrollment }
  #    else
  #      format.html { render :edit, status: :unprocessable_entity }
  #      format.json { render json: @enrollment.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /enrollments/1 or /enrollments/1.json
  def destroy
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: "Enrollment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.require(:enrollment).permit(:first_name, :last_name, :phone, :email, :goals, :previous_training, :comments, :preferred_date, :preferred_availability, :alternate_date, :alternate_availability, :location)
    end
end
