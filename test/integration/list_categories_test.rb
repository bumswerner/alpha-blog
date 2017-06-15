require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
 def setup
   @category_sports = Category.create(name: "sports")
   @category_programming = Category.create(name: "programming")
   @category_books = Category.create(name: "books")
 end
 
 test "should show categories listing" do
   get categories_path
   assert_template 'categories/index'
   assert_select "a[href=?]", category_path(@category_sports), text: @category_sports.name
   assert_select "a[href=?]", category_path(@category_programming), text: @category_programming.name
   assert_select "a[href=?]", category_path(@category_books), text: @category_books.name
   assert(3, Category.count)
 end
   
end