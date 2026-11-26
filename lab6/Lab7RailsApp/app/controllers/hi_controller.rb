class HiController < ApplicationController
  def index
    @stud = "Олександр Громов"
    @message = "Повідомлення з контроллера"
    @current_time = Time.now
  end
end