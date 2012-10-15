require 'minitest/autorun'

# See also:
# http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals#The_.25_Notation
#
describe "The % Notation" do
  describe "delimiter" do
    it "allows any alphanum character" do
      %(test).must_equal "test"
      %{test}.must_equal "test"
      %[test].must_equal "test"
      %<test>.must_equal "test"
      %%test 50\%%.must_equal "test 50%"
      %'test \'test'.must_equal "test 'test"
    end
    it "allows unescaped pair of () [] {} <>" do
      %(test (nested (test))).must_equal "test (nested (test))"
      %{tes{t} \{test\}}.must_equal "tes{t} {test}"
      %[tes[t] \[test\]].must_equal "tes[t] \[test]"
      %<tes<t> test\>>.must_equal "tes<t> test>"
    end
  end

  describe "modifiers" do
    it "Overview" do
      %(interpolated string (#{ "default" })).must_equal 'interpolated string (default)'
      %Q(interpolated string (#{ "default" })).must_equal 'interpolated string (default)'
      %q(non-interpolated string).must_equal 'non-interpolated string'
      %r(#{ "interpolated" } regexp)i.must_equal /interpolated regexp/i
      %w(non-interpolated\ string  separated\ by\ whitespaces).must_equal ['non-interpolated string', 'separated by whitespaces']
      %W(interpolated\ string #{ "separated by whitespaces" }).must_equal ['interpolated string', 'separated by whitespaces']
      %s(non-interpolated symbol).must_equal :'non-interpolated symbol'
      %x(echo #{ "interpolated shell command" }).must_equal "interpolated shell command\n"
    end

    it "Q - interpolated string (default)" do
      %(hi#{ 1 + 4 }).must_equal "hi5"
      %Q(hi#{ 1 + 4 }).must_equal "hi5"
    end
    it "q - non-interpolated string" do
      %q(foo\n #{bar}).must_equal 'foo\n #{bar}'
    end
    it "r - interpolated regexp" do
      '/path/to/MARS'.must_match %r(/path/to/mars)i  # regex flags after delimiter
    end
    it "s - non-interpolated symbol" do
      %s(symbol #{1 + 2}).must_equal :'symbol #{1 + 2}'
    end
    it "w - non-interpolated Array of words, separated by whitespaces" do
      %w(hi#{1+4}   ).must_equal ['hi#{1+4}']
      %w(hi#{1+4} lo5).must_equal ['hi#{1+4}', 'lo5']
      %w(
           hi#{1+4}
       lo5           ).must_equal ['hi#{1+4}', 'lo5']
      %w(a b\ c d).must_equal ['a', 'b c', 'd']
    end
    it "W - interpolated Array of words" do
      %W(hi#{1+4} lo5).must_equal ['hi5', 'lo5']
    end
    it "x - interpolated shell command" do
      %x(echo #{1+2}).must_equal "3\n"
    end
  end
end
