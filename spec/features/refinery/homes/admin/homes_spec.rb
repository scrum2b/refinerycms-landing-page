# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Homes" do
    describe "Admin" do
      describe "homes" do
        refinery_login_with :refinery_user

        describe "homes list" do
          before do
            FactoryGirl.create(:home, :title => "UniqueTitleOne")
            FactoryGirl.create(:home, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.homes_admin_homes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.homes_admin_homes_path

            click_link "Add New Home"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Homes::Home.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Homes::Home.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:home, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.homes_admin_homes_path

              click_link "Add New Home"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Homes::Home.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:home, :title => "A title") }

          it "should succeed" do
            visit refinery.homes_admin_homes_path

            within ".actions" do
              click_link "Edit this home"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:home, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.homes_admin_homes_path

            click_link "Remove this home forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Homes::Home.count.should == 0
          end
        end

      end
    end
  end
end
