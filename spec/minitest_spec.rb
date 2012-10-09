require 'minitest/autorun'

describe 'MiniTest' do
  it "assert with any operator" do
    1.must_be :==, 1
    1.must_be :<, 2
    1.must_be :>, 0
    1.must_be :<=, 1
    1.must_be :>=, 1
  end

  it "assert floating point" do
    f = 1.2341
    f.must_be_close_to 1.234, 0.0001
    f.must_be_within_delta 1.234, 0.0001
    f.must_be_within_epsilon 1.234, 0.0001 # what is epsilon?
  end

  it "assert instance" do
    a = []
    a.must_be_instance_of Array
    a.must_be_kind_of Array
  end

  it "assert included module" do
    [].must_be_kind_of Enumerable
  end

  it "assert nil" do
    nil.must_be_nil
  end

  it "assert same object" do
    a = "foo" 
    a.must_be_same_as a
    a.wont_be_same_as "foo"
  end

  it "assert no output in stdout, stderr" do
    proc {
      print ""
      $stderr.print ""
    }.must_be_silent
  end

  it "assert output in stdout, stderr" do
    proc {
      $stdout.print "stdout print"
      $stderr.print "stderr print"
    }.must_output "stdout print", "stderr print"
  end

  it "assert equal ==" do
    a = "foo" 
    a.must_equal "foo" 
  end

  it "collection has item" do
    arr = [1,2,3,4]
    arr.must_include 1
  end

  it "match regex" do
    "foo123".must_match /^foo\d{3}$/
    "123foo".wont_match /^foo\d{3}$/
  end

  it "assert raise exception" do
    ex = proc {
      raise ArgumentError, "error message"
    }.must_raise ArgumentError

    ex.must_be_instance_of ArgumentError
    ex.message.must_equal "error message"
  end

  it "assert respond_to" do
    [].must_respond_to "each"
    [].wont_respond_to "stranger"
  end

  it "assert throws" do
    proc {
      throw :foo
    }.must_throw :foo
  end

end
