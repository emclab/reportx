require 'spec_helper'

module Reportx
  describe ReportTemplatesController do
    before(:each) do
      controller.should_receive(:require_signin)
      controller.should_receive(:require_employee)
    end
  
    render_views
    
    describe "GET 'index'" do
      it "returns active report templates list for user with index right" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'index')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.create(:report_template, :active => true, :last_updated_by_id => u.id)
        cust1 = FactoryGirl.create(:report_template, :active => false, :name => 'new new name',  
                                   :last_updated_by_id => u.id)
        get 'index' , {:use_route => :reportx}
        assigns(:report_templates).should eq([cust])
      end 
      
      it "should show all report template for users with create right" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'create')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.create(:report_template, :active => true, :last_updated_by_id => u.id)
        cust1 = FactoryGirl.create(:report_template, :active => false, :name => 'new new name',  
                                   :last_updated_by_id => u.id)
        get 'index' , {:use_route => :reportx}
        assigns(:report_templates).should eq([cust1,cust])
      end
      
      it "should reject index for users without right" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'unknowncreate')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.create(:report_template, :active => true, :last_updated_by_id => u.id)
        cust1 = FactoryGirl.create(:report_template, :active => false, :name => 'new new name',  
                                   :last_updated_by_id => u.id)
        get 'index' , {:use_route => :reportx}
        response.should redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Insufficient right!")
      end
    end
  
    describe "GET 'new'" do
      it "returns http success for user with right for new" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'create')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.attributes_for(:report_template, :active => true, :last_updated_by_id => u.id)
        get 'new', {:use_route => :reportx}
        response.should be_success
      end
      
      it "should reject new for users without rihgt" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'unknowncreate')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.attributes_for(:report_template, :active => true, :last_updated_by_id => u.id)
        get 'new', {:use_route => :reportx}
        response.should redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Insufficient right!")
      end
    end
  
    describe "GET 'create'" do
      it "returns to previous page when success create" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'create')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.attributes_for(:report_template, :active => true, :last_updated_by_id => u.id)
        get 'create', {:use_route => :reportx, :report_template => cust}
        response.should redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Report Template Saved!")
      end
      
      it "should render new with data error" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'create')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.attributes_for(:report_template, :active => true, :last_updated_by_id => u.id, :name => nil)
        get 'create', {:use_route => :reportx, :report_template => cust}
        response.should render_template('new')
      end
    end
  
    describe "GET 'edit'" do
      it "returns success with edit for user with right" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'update')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.create(:report_template, :active => true, :last_updated_by_id => u.id)
        get 'edit', {:use_route => :reportx, :id => cust.id}
        response.should be_success
      end
    end
  
    describe "GET 'update'" do
      it "returns to previous page with success update" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'update')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.create(:report_template, :active => true, :last_updated_by_id => u.id)
        get 'update', {:use_route => :reportx, :id => cust.id, :report_template => {:name => 'newnew_name'}}
        response.should redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Report Template Updated!")
      end
      
      it "should render edit if data error" do
        z = FactoryGirl.create(:zone, :zone_name => 'hq')
        type = FactoryGirl.create(:group_type, :name => 'employee')
        ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
        ua = FactoryGirl.create(:sys_action_on_table, :table_name => 'reportx_report_templates', :action => 'update')
        ur = FactoryGirl.create(:sys_user_right, :sys_user_group_id => ug.id, :sys_action_on_table_id => ua.id)
        ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
        u = FactoryGirl.create(:user, :user_levels => [ul])
        session[:user_id] = u.id
        session[:user_privilege] = Authentify::UserPrivilegeHelper::UserPrivilege.new(u.id)
        cust = FactoryGirl.create(:report_template, :active => true, :last_updated_by_id => u.id)
        get 'update', {:use_route => :reportx, :id => cust.id, :report_template => {:name => ''}}
        response.should render_template("edit")
      end
    end
  
    describe "GET 'show'" do
      it "returns http success" do
        get 'show'
        response.should be_success
      end
    end
  
  end
end
