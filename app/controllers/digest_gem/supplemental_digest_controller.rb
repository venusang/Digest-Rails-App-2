require_dependency "digest_gem/application_controller"

module DigestGem
  class SupplementalDigestController < ApplicationController
    def index
      @books = current::Book.all(:book_type => "Supplemental Digest Section")
    end
    def show
      @book = current::Book.get(params[:id])
    end
  end
end
