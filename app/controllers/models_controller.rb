class ModelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @models = if params[:make_name] != ''
      Edmunds::Model.new
                  .find_models_by_make(params[:make_name])
                  .map { |model| model['name'] }
    else
      vehicle_models = []
      Edmunds::Make.new.find_all.map do |auto|
        auto['models'].map do |model|
          vehicle_models << model['name']
        end
      end
      vehicle_models
    end

    if request.xhr?
        render json: { models: @models }
     end
  end
end
