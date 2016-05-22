require_dependency "digest_gem/application_controller"

module DigestGem
  class RelatedContentsController < ApplicationController
    def index
      @related_contents = current::RelatedContent.all
    end
    def show
      @related_content = current::RelatedContent.get(params[:id])
    end
  end
end
