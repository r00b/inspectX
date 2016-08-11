class VisitorsController < ApplicationController
    def index
    end
    
    def show
       @inspection = Inspection.find(params[:id])
    end
end
