require 'spec_helper'

module Reportx
  describe TemplateAppendix do
    it "should be OK" do
      i = FactoryGirl.build(:template_appendix)
      i.should be_valid
    end
    
    it "should reject nil subject" do
      i = FactoryGirl.build(:template_appendix, :subject => nil)
      i.should_not be_valid
    end
    
    it "should reject duplicate section_num" do
      i = FactoryGirl.create(:template_appendix, :section_num => "1.2.3")
      i1 = FactoryGirl.build(:template_appendix, :section_num => "1.2.3")
      i1.should_not be_valid
    end
    
    it "should accept 1 as section num" do
      i = FactoryGirl.build(:template_appendix, :section_num => "1")
      i.should be_valid
    end
    
    it "should accept 1.2.3 as section num" do
      i = FactoryGirl.build(:template_appendix, :section_num => "1.2.3")
      i.should be_valid
    end
    
    it "should not take char as section num" do
      i = FactoryGirl.build(:template_appendix, :section_num => 'a.b.c')
      i.should_not be_valid
    end
    
    it "should accept nil section_num" do
      i = FactoryGirl.build(:template_appendix, :section_num => nil)
      i.should be_valid
    end

  end
end
