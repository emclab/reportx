# encoding: utf-8
module Reportx
  class TemplateContent < ActiveRecord::Base
    attr_accessible :content, :introduction, :last_updated_by_id, :report_template_id, :section_num, :subject, :chapter_num, :as => :role_new
    attr_accessible :content, :introduction, :last_updated_by_id, :report_template_id, :section_num, :subject, :chapter_num, :as => :role_update
    
    belongs_to :last_updated_by, :class_name => 'Authentify::User'
    belongs_to :report_template, :class_name => 'Reportx::ReportTemplate'
    
    section_num_regex = /^([1-9][0-9]?.){0,3}[0-9]$/i   #one issue: 0 is OK.
    
    validates :chapter_num, :presence => true,
                            :numericality => { :only_integer => true, :greater_than => 0, :less_than => 100 }
    validates :section_num, :format     => { :with => section_num_regex, :message => '章节格式错误！', :if => "section_num.present?"},
                            :uniqueness => {:scope => :report_template_id, :case_sensitive => false, :message => '章节重复！', :if => "section_num.present?"}
    validates_presence_of :subject
                            
  end
end
