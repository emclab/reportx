require 'spec_helper'

module Reportx
  describe ReportTemplate do
    it "should be OK" do
      i = FactoryGirl.build(:report_template)
      i.should be_valid
    end
    
    it "should reject nil name" do
      i = FactoryGirl.build(:report_template, :name => nil)
      i.should_not be_valid
    end
    
    it "should reject duplicate name" do
      i = FactoryGirl.create(:report_template, :name => "T1.2.3")
      i1 = FactoryGirl.build(:report_template, :name => "t1.2.3")
      i1.should_not be_valid
    end
    
    it "should reject nil report_type_id" do
      i = FactoryGirl.build(:report_template, :report_type_id => nil)
      i.should_not be_valid
    end
  end
end
