# encoding: utf-8
module Reportx
  class ReportTemplate < ActiveRecord::Base
    attr_accessible :active, :description, :last_updated_by_id, :name, :report_type_id, :as => :role_new
    attr_accessible :active, :description, :last_updated_by_id, :name, :report_type_id, :as => :role_update
    
    belongs_to :last_updated_by, :class_name => 'Authentify::User'
    belongs_to :report_type, :class_name => 'Reportx::ReportType'
    has_many :reports, :class_name => 'Reportx::Report'
    has_many :template_contents, :class_name => 'Reportx::TemplateContent'
    has_many :template_appendixes, :class_name => 'Reportx::TemplateAppendix'
    has_many :template_forewords, :class_name => 'Reportx::TemplateForeword'
    accepts_nested_attributes_for :template_contents, :allow_destroy => true
    accepts_nested_attributes_for :template_forewords, :allow_destroy => true
    accepts_nested_attributes_for :template_appendixes, :allow_destroy => true
    
    validates :name, :presence => true,
                     :uniqueness => {:case_sensitive => false}
    validates :report_type_id, :presence => true
  end
end
