require_dependency "digest_gem/application_controller"

module DigestGem
	class AdditionalProductInfosController < ApplicationController
		def index
			@products = current::AdditionalProductInfo.all
      @types = current::ProductTypeList.all
      @show = false
      if params.has_key?(:type)
        @data = @products.select{|x| x.product_type == params[:type]}
        @circuit_breakers = @data.map{|x| x.main_category}.delete_if{|x| x == 'All'}.uniq.sort_by{|x| x}
        @type =  current::ProductTypeList.first(:name => params[:type])
        if params.has_key?(:secondary)
          @show = true
          @show = false if params[:secondary] == ""
          if params[:secondary] == 'All'
            @data = @data.select{|x| x.main_category == params[:select]}
          else
            @data = @data.select{|x| x.main_category == params[:select] && (x.sub_category == params[:secondary] || x.sub_category == nil) }
          end
        elsif params.has_key?(:select)
          @show = true if @type.sub_category_label == ''
          @data = @data.select{|x| x.main_category == params[:select]}
          if params[:select] != ""
            @secondary_list = @data.map{|x| x.sub_category }.uniq.compact.sort_by{|x| x}.unshift('All')
          end
        end

      else
        @data = @products.select{|x| x.product_type == "Time-Current Curves"}
        @type =  current::ProductTypeList.first(:name => "Time-Current Curves")
        if params.has_key?(:select)
          @data = @data.select{|x| x.main_category == params[:select]}
        end
        @circuit_breakers = @data.map{|x| x.main_category}.uniq
      end
      if request.xhr?
        render :partial => 'index.js.erb'
      else
        # respond with your normal layout if required
      end

		end
		def show
      @products = current::AdditionalProductInfo.all
      @white_papers = @products.select{|x| x.product_type == "White Papers"}
      @twod_drawings = @products.select{|x| x.product_type == "2d Cad Drawings"}
      @threed_drawings = @products.select{|x| x.product_type == "3d Cad Drawings"}
      @threed_drawings = @products.select{|x| x.product_type == "Trip Curves"}
		end
	end
end
