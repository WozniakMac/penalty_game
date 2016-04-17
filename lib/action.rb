# lib/action.rb
class Action
  XMIN = 0
  XMAX = 4
  YMIN = 0
  YMAX = 2
  attr_reader :errors, :x, :y

  def initialize(x, y)
    @errors = []
    validation(x, y)
    @x = x
    @y = y
  end

  def valid?
    @errors.empty?
  end

  private

  def validation(x, y)
    case
    when !x.is_a?(Integer)
      @errors << "#{x} is not permited pameter"
    when !y.is_a?(Integer)
      @errors << "#{y} is not permited pameter"
    when x < XMIN || x > XMAX
      @errors << "#{x} must be between #{XMIN} and #{XMAX}"
    when y < YMIN || y > YMAX
      @errors << "#{y} must be between #{YMIN} and #{YMAX}"
    end
  end
end
