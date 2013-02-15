require_dependency "reportx/application_controller"

module Reportx
  class ReportTypesController < ApplicationController
    before_filter :require_signin
    before_filter :require_employee
    
    def index
      @title = 'Report Type'
      if has_create_right?('reportx_report_types') || has_update_right?('reportx_report_types')
        @report_types = Reportx::ReportType.order('active DESC, name')
      else
        @report_types = Reportx::ReportType.where(:active => true).order('name')
      end
    end
  
    def new
      @title = 'New Report Type'
      if has_create_right?('reportx_report_types')
        @report_type = Reportx::ReportType.new
      else
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Insufficient Right!")
      end
    end
  
    def create
      if has_create_right?('reportx_report_types')
        @report_type = Reportx::ReportType.new(params[:report_type], :as => :role_new)
        @report_type.last_updated_by_id = session[:user_id]
        @report_type.active = true #no default in db
        if @report_type.save
          redirect_to report_types_path, :notice => "Report Type Saved!"
        else
          flash.now[:error] = 'Data Error. Not Saved!'
          render 'new'
        end
      end
    end
  
    def edit
      @title = 'Update Report Type'
      if has_update_right?("reportx_report_types")
        @report_type = Reportx::ReportType.find_by_id(params[:id])
      else
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Insufficient Right!")
      end
    end
  
    def update
      if  has_update_right?('reportx_report_types')
        @report_type = Reportx::ReportType.find_by_id(params[:id])
        @report_type.last_updated_by_id = session[:user_id]
        if @report_type.update_attributes(params[:report_type], :as => :role_update)
          redirect_to report_types_path, :notice => "Report Type Updated!"
        else
          flash.now[:error] = 'Data Error. Not Updated!'
          render 'edit'
        end
      end
    end
  end
end
