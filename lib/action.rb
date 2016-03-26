class Action
  XMIN = 0
  XMAX = 4
  YMIN = 0
  YMAX = 2
  
  attr_reader :errors, :x, :y

  def initialize(x, y)
    @errors = []
    validation(x, y)
    if valid?
      @x = x
      @y = y
    end  
  end

  def valid?
    @errors.empty?
  end

  private
    def validation(x, y)
      if !x.is_a? Integer
        @errors << "#{x} is not permited pameter"
      elsif !y.is_a? Integer
        @errors << "#{y} is not permited pameter"  
      elsif x < XMIN or x > XMAX
        @errors << "#{x} must be between #{XMIN} and #{XMAX}"
      elsif y < YMIN or y > 2
        @errors << "#{y} must be between #{YMIN} and #{YMAX}"  
      end
    end
end