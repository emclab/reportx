require 'spec_helper'

module Reportx
  describe ReportType do
    it "should be OK" do
      i = FactoryGirl.build(:report_type)
      i.should be_valid
    end
    
    it "should reject nil name" do
      i = FactoryGirl.build(:report_type, :name => nil)
      i.should_not be_valid
    end
    
    it "should reject duplicate name" do
      i = FactoryGirl.create(:report_type, :name => "T1.2.3")
      i1 = FactoryGirl.build(:report_type, :name => "t1.2.3")
      i1.should_not be_valid
    end
  end
end
