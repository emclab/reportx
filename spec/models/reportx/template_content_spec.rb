require 'spec_helper'

module Reportx
  describe TemplateContent do
    it "should be OK" do
      i = FactoryGirl.build(:template_content)
      i.should be_valid
    end
    
    it "should reject nil subject" do
      i = FactoryGirl.build(:template_content, :subject => nil)
      i.should_not be_valid
    end
    
    it "should reject duplicate section_num" do
      i = FactoryGirl.create(:template_content, :section_num => "1.2.3")
      i1 = FactoryGirl.build(:template_content, :section_num => "1.2.3")
      i1.should_not be_valid
    end
    
    it "should accept 1 as section num" do
      i = FactoryGirl.build(:template_content, :section_num => "1")
      i.should be_valid
    end
    
    it "should accept 1.2.3 as section num" do
      i = FactoryGirl.build(:template_content, :section_num => "1.2.3")
      i.should be_valid
    end
    
    it "should not take char as section num" do
      i = FactoryGirl.build(:template_content, :section_num => 'a.b.c')
      i.should_not be_valid
    end
    
    it "should accept nil section_num" do
      i = FactoryGirl.build(:template_content, :section_num => nil)
      i.should be_valid
    end
    
    it "should reject nil chapter_num" do
      i = FactoryGirl.build(:template_content, :chapter_num => nil)
      i.should_not be_valid
    end
    
    it "should reject char chapter_num" do
      i = FactoryGirl.build(:template_content, :chapter_num => 'nil')
      i.should_not be_valid
    end
    
    it "should reject 100 chapter_num" do
      i = FactoryGirl.build(:template_content, :chapter_num => 100)
      i.should_not be_valid
    end
    
    it "should be OK with chapter_num of 99" do
      i = FactoryGirl.build(:template_content, :chapter_num => 99)
      i.should be_valid
    end
    
    it "should be OK with chapter_num of 99" do
      i = FactoryGirl.build(:template_content, :chapter_num => 1)
      i.should be_valid
    end
    
  end
end
