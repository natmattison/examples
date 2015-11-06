class Encoder
  attr_reader :result
  
  def initialize(input)
    create_tree(input)
    encode(input)
  end
  
  def create_tree(input)
    frequencies = {}
    
    input.split("").each do |c|
      if frequencies.has_key?(c)
        frequencies[c] += 1
      else
        frequencies[c] = 1
      end
    end
    
    @frequency_array = frequencies.sort_by {|k, v| v}.reverse.map {|(c, f)| c}

  end
  
  def encode(input)
    @result = ''
    input.split("").each do |c|
      index = @frequency_array.index(c)
      encoded_c = ''
      index.times {encoded_c += '1'}
      encoded_c += '0'
      @result += encoded_c
    end
  end

  def decode(encoded_string)
    string = ""
    c = encoded_string[0]
    counter = 0
    encoded_string.split("").each do |c|
      if c == '1'
        counter += 1
      else
        string += @frequency_array[counter]
        counter = 0
      end
    end
    return string
  end
end
