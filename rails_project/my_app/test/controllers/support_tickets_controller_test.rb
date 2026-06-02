require "test_helper"

class SupportTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get support_tickets_index_url
    assert_response :success
  end
end
