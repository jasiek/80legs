require 'test/helper'

class TestEightyFormat < Test::Unit::TestCase
  TEST_80 = 'test/test_data/wikipedia.80'
  TEST_80_HTML = 'test/test_data/wikipedia-index.html'
  
  def test_parse_correct
    [File.open(TEST_80), TEST_80].each do |file_or_io|
      howmany = 0
      file = EightyFormat.new(file_or_io).each do |entry|
        assert_equal("http://en.wikipedia.org/wiki/Main_Page", entry.url)
        assert_equal(File.open(TEST_80_HTML).read, entry.data)
        howmany += 1
        break
      end
      assert_equal(1, howmany)
    end
     
    [File.open(TEST_80), TEST_80].each do |file_or_io|
      howmany = 0
      EightyFormat.new(file_or_io).each do |entry|
        howmany += 1
      end
      assert_equal(91, howmany)
    end
  end

  def test_dont_parse_incorrect
    assert_raises(EightyFormat::FileFormatError) do
      EightyFormat.new(TEST_80_HTML).each do
        # NOOP
      end
    end
  end
end

