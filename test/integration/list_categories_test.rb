require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
 def setup
   @category_book = Category.create(name: "books")
   @category_programming = Category.create(name: "programming")
 end
 
 test "should show categories listing" do
   get categories_path
   assert_template 'categories/index'
   assert_select "a[href=?]", category_path(@category_book), text: @category_book.name
   assert_select "a[href=?]", category_path(@category_programming), text: @category_programming.name
 end
   
end