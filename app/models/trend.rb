class Trend
  attr_reader :current, :previous, :type

  def initialize(current:, previous: nil, type: :asset)
    @current = current
    @previous = previous
    @type = type # :asset means positive trend is good, :liability means negative trend is good
  end

  def direction
    return "flat" unless @previous
    return "up" if @current > @previous
    return "down" if @current < @previous
    "flat"
  end

  def amount
    return 0 if @previous.nil?
    @current - @previous
  end

  def percent
    return 0 if @previous.nil?
    return Float::INFINITY if @previous == 0
    ((@current - @previous).abs / @previous.to_f * 100).round(1)
  end
end
