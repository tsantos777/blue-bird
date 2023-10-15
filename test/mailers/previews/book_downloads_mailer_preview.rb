# Preview all emails at http://localhost:3000/rails/mailers/book_downloads_mailer
class BookDownloadsMailerPreview < ActionMailer::Preview

  def new_book_download
    book_download = BookDownload.last
    BookDownloadsMailer.book_downloads(book_download)
  end

end
