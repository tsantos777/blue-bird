class QuizResultsController < ApplicationController
  before_action :set_quiz_result, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:create, :new, :confirmation]
  invisible_captcha only: [:create], honeypot: :confirm_email

  # GET /quiz_results or /quiz_results.json
  def index
    @quiz_results = QuizResult.all
  end

  # GET /quiz_results/1 or /quiz_results/1.json
  def show
  end

  # GET /quiz_results/new
  def new
    @quiz_result = QuizResult.new
  end

  # GET /quiz_results/1/edit
  def edit
  end

  # POST /quiz_results or /quiz_results.json
  def create
    @quiz_result = QuizResult.new(quiz_result_params)
    #success = verify_recaptcha(action: 'quiz', minimum_score: 0.2, secret_key: ENV['RECAPTCHA_SECRET_KEY'])
    #checkbox_success = verify_recaptcha unless success

    respond_to do |format|
      if @quiz_result.save #&& (success || checkbox_success)
        QuizResultMailer.quiz_result_email(@quiz_result).deliver_later
        format.html { redirect_to quiz_confirmation_path, notice: "#{@quiz_result.first_name}" }
        #format.json { render :show, status: :created, location: @quiz_result }
      else
        format.html { 
          #if !success
          #  @show_checkbox_recaptcha = true
          #end
          render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_results/1 or /quiz_results/1.json
  #def update
  #  respond_to do |format|
  #    if @quiz_result.update(quiz_result_params)
  #      format.html { redirect_to quiz_result_url(@quiz_result), notice: "Quiz result was successfully updated." }
  #      format.json { render :show, status: :ok, location: @quiz_result }
  #    else
  #      format.html { render :edit, status: :unprocessable_entity }
  #      format.json { render json: @quiz_result.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /quiz_results/1 or /quiz_results/1.json
  def destroy
    @quiz_result.destroy

    respond_to do |format|
      format.html { redirect_to quiz_results_url, notice: "Quiz result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_result
      @quiz_result = QuizResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_result_params
      params.require(:quiz_result).permit(:first_name, :last_name, :email, :program, :why_pilot, :previous_training, :wings_lift, :goals, :preferred_date, :preferred_availability, :alternate_date, :alternate_availability, :comments, :phone, :learn_style, :structure, :guidance)
    end
end
