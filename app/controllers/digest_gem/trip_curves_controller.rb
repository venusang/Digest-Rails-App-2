require_dependency "digest_gem/application_controller"

module DigestGem
  class TripCurvesController < ApplicationController
    def index
      @trip_curves = current::TripCurve.all
    end
    def show
      @trip_curve = current::TripCurve.get(params[:id])
    end
  end
end
