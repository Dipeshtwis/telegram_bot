require_relative '../lib/quote.rb'
require_relative '../lib/joke.rb'

describe Quote do
  let(:value) { Quote.new }
  describe '#provide_quote' do
    it 'return class array in response when send the json request' do
      expect(value.provide_quote.class).to eql(Array)
    end

    it 'the length of the array should not be equal to zero' do
      expect(value.provide_quote.length).not_to eql(0)
    end
  end

  describe '#choose_random' do
    it 'return a class hash' do
      expect(value.choose_random.class).to eql(Hash)
    end

    it 'return a key-value pair' do
      expect(value.choose_random.length).to eql(2)
    end
  end
end

describe Joke do
  let(:value) { Joke.new }
  describe '#provide_joke' do
    it 'return class string in response when send the json request' do
      expect(value.provide_joke.read_body.class).to eql(String)
    end

    it 'the length of the string should not be equal to zero' do
      expect(value.provide_joke.read_body.length).not_to eql(0)
    end
  end
end
