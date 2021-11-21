class ApplicationController < ActionController::Base
  before_action :last_reading

  def last_reading
    @last_reading = Reading.last
  end
end
