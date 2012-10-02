require 'minitest/autorun'

describe "Kernel#Array" do
  it "converts single value object to array" do
    input = "foo"

    arry = input.kind_of?(Array) ? input : [input]

    Array(input).must_equal ["foo"]
    Array(input).must_equal arry
  end

  it "converts nil to empty array" do
    input = nil

    arry = input || []

    Array(input).must_equal []
    Array(input).must_equal arry
  end

  it "returns the same array if given an array" do
    input = [1,2,3]

    Array(input).must_equal [1,2,3]
  end

  it "converts hash to array via Hash#to_a" do
    input = {a:1, b:2}

    Array(input).must_equal [[:a,1], [:b,2]]
  end

  it "converts range into an array" do
    input = 1..3

    Array(input).must_equal [1,2,3]
  end
end
