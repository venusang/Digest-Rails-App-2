require_dependency "digest_gem/application_controller"

module DigestGem
  class SettingsController < ApplicationController
    def index
      @settings = current::Setting.all
    end
    def show
      @setting = current::Setting.get(params[:id])
    end
  end
end
