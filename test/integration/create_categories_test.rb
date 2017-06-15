require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path  # exist the rout
    assert_template 'categories/new' # exist the view-template
    assert_difference 'Category.count', 1 do  # is one category added
      post categories_path, params: {category: {name: "sports"}} # linked to 
      follow_redirect! # important
    end
    assert_template 'categories/index'  # exist the view-template
    assert_match "sports", response.body # is the category name valid
  end
  
  test "invalid category submission result in failure" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: " "}}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
end