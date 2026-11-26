require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "registration stores the name and assigns the user role" do
    email = "new-booker@example.com"

    assert_difference("User.count", 1) do
      post user_registration_path, params: {
        user: {
          name: "Новий користувач",
          email: email,
          password: "test-password-123",
          password_confirmation: "test-password-123"
        }
      }
    end

    user = User.find_by!(email: email)
    assert_equal "Новий користувач", user.name
    assert_equal "user", user.role
  end
end