class NumTranslator

  def initialize(roman_numeral)
    @numeral = roman_numeral.upcase
  end

  def detect_exception
    if @numeral.include?("IV")
      @numeral = @numeral.split("IV").push("4").inject(:+)
      if @numeral.include?("XL")
      @numeral = @numeral.split("XL").push("F").inject(:+)
      elsif @numeral.include?("XC")
      @numeral = @numeral.split("XC").push("N").inject(:+)
      else
      @numeral
      end
    elsif @numeral.include?("IX")
      @numeral = @numeral.split("IX").push("9").inject(:+)
      if @numeral.include?("XL")
      @numeral = @numeral.split("XL").push("F").inject(:+)
      elsif @numeral.include?("XC")
      @numeral = @numeral.split("XC").push("N").inject(:+)
      else
      @numeral
      end
    elsif @numeral.include?("XL")
      @numeral = @numeral.split("XL").push("F").inject(:+)
      elsif @numeral.include?("XC")
      @numeral = @numeral.split("XC").push("N").inject(:+)
    else
      @numeral
    end
  end

  def translator
    hashmap = {"I"=>1,"4"=>4,"V"=>5,"9"=>9,"X"=>10,"F"=>40,"L"=>50,"N"=>90,"C"=>100,"D"=>500,"M"=>1000}
    @numeral = self.detect_exception
    @numeral = @numeral.split('').collect do |numeral|
      hashmap[numeral]
    end
    @numeral.inject(:+)  
  end
end
puts "Enter roman numeral to convert to arabic numeral: "
puts NumTranslator.new(gets.chomp).translator
