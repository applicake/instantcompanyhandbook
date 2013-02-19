require 'abstract_unit'
require 'active_support/core_ext/object/blank'

class GzipTest < Test::Unit::TestCase
  def test_compress_should_decompress_to_the_same_value
    assert_equal "Hello World", ActiveSupport::Gzip.decompress(ActiveSupport::Gzip.compress("Hello World"))
  end

  def test_compress_should_return_a_binary_string
    compressed = ActiveSupport::Gzip.compress('')

    if "".encoding_aware?
      assert_equal Encoding.find('binary'), compressed.encoding
    end

    assert !compressed.blank?, "a compressed blank string should not be blank"
  end
end
