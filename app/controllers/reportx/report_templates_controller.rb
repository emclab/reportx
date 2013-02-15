require_dependency "reportx/application_controller"

module Reportx
  class ReportTemplatesController < ApplicationController
    before_filter :require_signin
    before_filter :require_employee
    
    def index
      if has_index_right?("reportx_report_templates")
        @report_templates = Reportx::ReportTemplate.where(:active => true).order("id DESC")
      elsif has_create_right?("reportx_report_templates")
        @report_templates = Reportx::ReportTemplate.order("active DESC, id DESC")
      else
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Insufficient right!")
      end
    end
  
    def new
      if has_create_right?("reportx_report_templates")
        @report_template = Reportx::ReportTemplate.new()
      else
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Insufficient right!")
      end
    end
  
    def create
      if has_create_right?("reportx_report_templates")
        @report_template = Reportx::ReportTemplate.new(params[:report_template], :as => :role_new)
        @report_template.last_updated_by_id = session[:user_id]
        if @report_template.save
          redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Report Template Saved!")
        else
          flash.now[:error] = 'Data error. NOT Saved!'
          render 'new'
        end
      end
    end
  
    def edit
      if has_update_right?("reportx_report_templates")
        @report_template = Reportx::ReportTemplate.find_by_id(params[:id])
      else
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Insufficient right!")
      end
    end
  
    def update
      if has_update_right?("reportx_report_templates")
        @report_template = Reportx::ReportTemplate.find_by_id(params[:id])
        @report_template.last_updated_by_id = session[:user_id]
        if @report_template.update_attributes(params[:report_template], :as => :role_update)
          redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Report Template Updated!")
        else
          flash.now[:error] = 'Data error. NOT Updated!'
          render 'edit' 
        end      
      end
    end
  
    def show
      if has_show_rights("reportx_report_templates")
        @report_template = Reportx::ReportTemplate.find_by_id(params[:id])
      else
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Insufficient right!")
      end
    end
  end
end
