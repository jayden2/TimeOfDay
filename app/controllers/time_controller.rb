class TimeController < ApplicationController
  def index
  	time = Time.now
  	@colour = ""
  	@hour = time.hour.to_s
  	@minute = time.min.to_s
  	@second = time.sec.to_s

  	@hour.length == 1 ? @colour << @hour = "0#{@hour}" : @colour << @hour
  	@minute.length == 1 ? @colour << @minute = "0#{@minute}" : @colour << @minute
  	@second.length == 1 ? @colour << @second = "0#{@second}" : @colour << @second

  end
end
