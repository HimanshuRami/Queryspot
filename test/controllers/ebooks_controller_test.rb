require 'test_helper'

class EbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ebooks_index_url
    assert_response :success
  end

  test "should get new" do
    get ebooks_new_url
    assert_response :success
  end

  test "should get create" do
    get ebooks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get ebooks_destroy_url
    assert_response :success
  end

end
