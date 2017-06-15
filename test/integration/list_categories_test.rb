require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
 def setup
   @category_sports = Category.create(name: "sports")
   @category_programming = Category.create(name: "programming")
 end
 
 test "should show categories listing" do
   get categories_path
   assert_template 'categories/index'
   assert_select "a[href=?]", category_path(@category_sports), text: @category_sports.name
   assert_select "a[href=?]", category_path(@category_programming), text: @category_programming.name
 end
   
end