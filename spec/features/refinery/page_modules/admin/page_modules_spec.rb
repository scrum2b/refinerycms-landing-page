# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PageModules" do
    describe "Admin" do
      describe "page_modules" do
        refinery_login_with :refinery_user

        describe "page_modules list" do
          before do
            FactoryGirl.create(:page_module, :title => "UniqueTitleOne")
            FactoryGirl.create(:page_module, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.page_modules_admin_page_modules_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.page_modules_admin_page_modules_path

            click_link "Add New Page Module"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PageModules::PageModule.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::PageModules::PageModule.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:page_module, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.page_modules_admin_page_modules_path

              click_link "Add New Page Module"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PageModules::PageModule.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:page_module, :title => "A title") }

          it "should succeed" do
            visit refinery.page_modules_admin_page_modules_path

            within ".actions" do
              click_link "Edit this page module"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:page_module, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.page_modules_admin_page_modules_path

            click_link "Remove this page module forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PageModules::PageModule.count.should == 0
          end
        end

      end
    end
  end
end
