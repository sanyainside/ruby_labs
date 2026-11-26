require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)

    get new_booking_url
    assert_response :success
  end

  test "should create booking" do
    sign_in users(:one)

    assert_difference("Booking.count", 1) do
      post bookings_url, params: {
        booking: {
          building: "Корпус А",
          floor: 3,
          room: "A-303",
          booked_by: "Олександр",
          starts_at: "2027-01-16T10:00",
          ends_at: "2027-01-16T11:00",
          description: "Планування завдань команди на наступний тиждень."
        }
      }
    end

    created = Booking.find_by!(room: "A-303")
    assert_redirected_to booking_url(created)
    assert_equal users(:one), created.user
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)

    get edit_booking_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    sign_in users(:one)

    patch booking_url(@booking), params: { booking: { room: "A-102" } }

    assert_redirected_to booking_url(@booking)
    assert_equal "A-102", @booking.reload.room
  end

  test "should destroy booking" do
    sign_in users(:one)

    assert_difference("Booking.count", -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to bookings_url
  end

  test "another user cannot update or delete a booking" do
    sign_in users(:two)

    original_room = @booking.room
    patch booking_url(@booking), params: { booking: { room: "Чужа зміна" } }
    assert_response :forbidden
    assert_equal original_room, @booking.reload.room

    assert_no_difference("Booking.count") do
      delete booking_url(@booking)
    end
    assert_response :forbidden
  end

  test "admin can edit another user's booking" do
    sign_in users(:admin)

    get edit_booking_url(@booking)
    assert_response :success

    patch booking_url(@booking), params: { booking: { room: "A-305" } }
    assert_redirected_to booking_url(@booking)
    assert_equal "A-305", @booking.reload.room
  end
end