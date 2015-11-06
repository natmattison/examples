require_relative '../encoder'

describe "#encode" do

  context "strings" do
    let(:strings) {
      [
        "rchrchrchrch",
        "abaccabacaaaar",
        "bcaaaac",
        "a",
        "this is an example string text hooray",
        "bbbbb"
      ]
    }

    it "returns original string when decoding result" do
      strings.each do |s|
        e = Encoder.new(s)
        decoded = e.decode(e.result)
        
        expect(decoded).to eq(s)
      end
    end

  end

end
