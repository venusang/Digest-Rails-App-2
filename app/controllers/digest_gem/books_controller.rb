require_dependency "digest_gem/application_controller"

module DigestGem
  class BooksController < ApplicationController
      def index
        @books = current::Book.all(:book_type => "Digest Section")
      end
      def show
        @book = current::Book.get(params[:id])
      end

  end
end
