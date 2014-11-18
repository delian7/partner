class ReportsController < ApplicationController

  def index
	@grid = ReportsGrid.new(params[:reports_grid]) do |scope|
		scope.page(params[:reports])  
	end
    respond_to do |f|
      f.html do
        @assets = @grid.assets.page(params[:page])
      end
      f.csv do
        send_data @grid.to_csv, 
          type: "text/csv", 
          disposition: 'inline', 
          filename: "grid-#{Time.now.to_s}.csv"
      end
  end
  end
end