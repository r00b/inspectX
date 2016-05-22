class VisitorsController < ApplicationController
    def show
       @inspection = Inspection.find(params[:id])  
    end
end
