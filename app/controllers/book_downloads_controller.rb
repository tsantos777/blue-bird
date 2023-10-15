class BookDownloadsController < ApplicationController
  before_action :set_book_download, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:create, :confirmation]
  invisible_captcha only: [:create], honeypot: :confirm_email

  def confirmation
    render 'confirm'
  end

  # GET /book_downloads or /book_downloads.json
  def index
    @book_downloads = BookDownload.all
  end

  # GET /book_downloads/1 or /book_downloads/1.json
  def show
  end

  # GET /book_downloads/new
  def new
    @book_download = BookDownload.new
  end

  # GET /book_downloads/1/edit
  def edit
  end

  # POST /book_downloads or /book_downloads.json
  def create
    @book_download = BookDownload.new(book_download_params)

    respond_to do |format|
      if @book_download.save
        BookDownloadsMailer.book_downloads(@book_download).deliver_later
        format.html { redirect_to book_download_confirmation_path, notice: @book_download.name }
        #format.json { render :show, status: :created, location: @book_download }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_download.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_downloads/1 or /book_downloads/1.json
  #def update
  #  respond_to do |format|
  #    if @book_download.update(book_download_params)
  #      
  #      format.html { redirect_to book_download_url(@book_download), notice: "Book download was successfully updated." }
  #      format.json { render :show, status: :ok, location: @book_download }
  #    else
  #      format.html { render :edit, status: :unprocessable_entity }
  #      format.json { render json: @book_download.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /book_downloads/1 or /book_downloads/1.json
  def destroy
    @book_download.destroy

    respond_to do |format|
      format.html { redirect_to book_downloads_url, notice: "Book download was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_download
      @book_download = BookDownload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_download_params
      params.require(:book_download).permit(:name, :email, :phone)
    end
end
