class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string(*args)
    hours = @seconds / 3600
    min_sec = @seconds % 3600
    sprintf("%02d:%02d:%02d", hours , min_sec/60 , min_sec%60)
  end
end
