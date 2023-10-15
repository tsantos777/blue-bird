class BookDownloadsMailer < ApplicationMailer

  default from: 'no-reply@simplifly-co.com'

  def book_downloads(book_download)
    @book_download = book_download

    mail(to: @book_download.email, bcc: ["info@simplifly-co.com", "info@simpliflyco.com"], subject: "✈️ SimpliFly FREE Pilot Training Booklet")
  end


end
