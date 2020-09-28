require_relative '../src/wordwrap'

describe "wordwrap" do
  
  it "has two arguments" do      
    expect(WordWrap.new).to respond_to(:wrap).with(2).argument
  end

  same_length_string = {
      "hello" => "hello",
      "oryeh" => "oryeh",
      "coffee" => "coffee"
    } 
  
  same_length_string.each do |string, output|
    it "doesn't wrap if line length is same as word length" do
      expect(WordWrap.new.wrap(string, string.length)).to eq(output)
    end
  end

  two_words_string = {
    {:string => 'hello world', :length: 5} => "hello\nworld",
    {:string => 'hello hello', :length 5} => "hello\nhello",
    {:string => 'coffee coffee', :length => 6} => "coffee\ncoffee",
  }
  two_words_string.each do |input, output|
    it "wraps after space" do
      expect(WordWrap.new.wrap(input[:string], input[:length])).to eq(output)
    end
  end

end