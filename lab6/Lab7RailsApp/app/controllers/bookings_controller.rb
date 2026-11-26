class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @selected_building = params[:building].presence
    @selected_floor = params[:floor].presence

    @buildings = Booking.where.not(building: [nil, ""])
                        .distinct.order(:building).pluck(:building)

    bookings = Booking.all
    bookings = bookings.where(building: @selected_building) if @selected_building

    @floors = bookings.where.not(floor: nil)
                      .distinct.order(:floor).pluck(:floor)

    bookings = bookings.where(floor: @selected_floor) if @selected_floor
    @bookings = bookings.order(:id)
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @booking.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @booking.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_path, notice: "Booking was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def destroy_all
    deleted_count = Booking.delete_all

    redirect_to bookings_path,
                notice: "Видалено бронювань: #{deleted_count}.",
                status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.expect(booking: [ :building, :floor, :room, :booked_by, :starts_at, :ends_at ])
    end
end
