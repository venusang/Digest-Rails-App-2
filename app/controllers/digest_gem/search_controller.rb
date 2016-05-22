require_dependency "digest_gem/application_controller"

module DigestGem
  class SearchController < ApplicationController
    def index
      @results = []
      @term = params[:search] if !params[:search].blank?
      @results = current::DigestSearchAllDocument.keyword_search(params) if  !params[:search].blank?
      @sections = @results.map{|x| x.document_type}.uniq
    end
  end
end
