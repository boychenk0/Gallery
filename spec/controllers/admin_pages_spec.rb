require 'spec_helper'

describe "AdminPages" do
end
#  describe "GET /admin_pages" do
#    before do
#      @admin = FactoryGirl.create(:admin_user)
#      sign_in @admin
#    end
#
#    describe "check all pages:" do
#      all_admin_pages = Dir['app/admin/*.rb'].map { |entry| entry[/[^\/]+\.rb/][0..-4] }
#      puts all_admin_pages
#      if all_admin_pages.delete('dashboards')
#        it 'dashboard' do
#          get send("admin_dashboard_path")
#          response.status.should be(200)
#        end
#      end
#
#      #all_admin_pages.each do |path|
#        it "vasya -> INDEX" do
#          get 'admin/comments'
#          response.status.should be(200)
#        end
      #end

      #all_admin_pages.each do |path|
      #  path = path.singularize
      #  it "#{path} -> NEW" do
      #    get send("new_admin_#{path}_path")
      #    response.status.should be(200)
      #  end
      #
      #  it "#{path} -> CREATE" do
      #    #not just attributes_for, because then associated ids are not set up
      #    attributes = FactoryGirl.build(path).attributes
      #    #user should have password, generated with #attributes_for
      #    attributes.merge!(FactoryGirl.attributes_for(:user)) if path == 'user'
      #    post send("admin_#{path.pluralize}_path"),
      #         { path => attributes }
      #    response.status.should be(302)
      #    response.should redirect_to(:action => :show, :id => assigns(path))
      #  end
      #
      #  it "#{path} -> EDIT" do
      #    get send("edit_admin_#{path}_path", FactoryGirl.create(path))
      #    response.status.should be(200)
      #  end
      #
      #  it "#{path} -> UPDATE" do
      #    object = FactoryGirl.create(path)
      #    attributes = FactoryGirl.attributes_for(path)
      #    #except password for user
      #    attributes.except!(:password, :password_confirmation) if path == 'user'
      #    put send("admin_#{path}_path", object),
      #        { path => attributes }
      #    response.status.should be(302)
      #    updated_object = assigns(path)
      #    response.should redirect_to(:action => :show, :id => updated_object)
      #    attributes.each do |k,v|
      #      updated_object[k].should == v
      #    end
      #  end
      #
      #  it "#{path} -> SHOW" do
      #    get send("admin_#{path}_path", FactoryGirl.create(path))
      #    response.status.should be(200)
      #  end
      #
      #  it "#{path} -> DELETE" do
      #    delete send("admin_#{path}_path", FactoryGirl.create(path))
      #    response.status.should be(302)
      #  end
      #end
#    end
#  end
#end