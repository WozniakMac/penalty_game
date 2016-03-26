class Action
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
      elsif x < 0 or x > 4
        @errors << "#{x} must be between 0 and 4"
      elsif y < 0 or y > 2
        @errors << "#{y} must be between 0 and 2"  
      end
    end
end