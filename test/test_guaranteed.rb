require 'minitest/autorun'
require 'guaranteed'

class TestGuaranteed < Minitest::Test
  class Example
  end

  def test_object_returns_a_null_object_if_object_is_nil
    object = Guaranteed.Object(nil)
    assert_equal(Guaranteed::NullObject, object.class)
    assert_equal(true, object.nil?)
  end

  def test_object_returns_the_object_if_object_is_not_nil
    assert_equal('the-object', Guaranteed.Object('the-object'))
    object = Example.new
    assert_equal(object, Guaranteed.Object(object))
  end

  def test_object_can_chain_methods
    res = Guaranteed.Object(nil).this.is.definitely.missing
    assert_equal(true, res.nil?)
    assert_equal(Guaranteed::NullObject, res.class)
  end
end