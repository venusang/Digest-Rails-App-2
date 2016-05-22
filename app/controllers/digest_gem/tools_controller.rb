require_dependency "digest_gem/application_controller"

module DigestGem
  class ToolsController < ApplicationController
    def index
      @tools = current::Tool.all
    end
    def show
      @tool = current::Tool.get(params[:id])
    end
  end
end
