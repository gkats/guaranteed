require 'minitest/autorun'
require 'guaranteed/null_object'

class TestNullObject < Minitest::Test
  def test_to_a_returns_an_empty_array
    assert_equal([], Guaranteed::NullObject.new.to_a)
  end

  def test_to_s_returns_an_empty_string
    assert_equal('', Guaranteed::NullObject.new.to_s)
  end

  def test_to_h_returns_an_empty_hash
    assert_equal({}, Guaranteed::NullObject.new.to_h)
  end

  def test_to_i_returns_zero
    assert_equal(0, Guaranteed::NullObject.new.to_i)
  end

  def test_to_f_returns_zero_float
    assert_equal(0.0, Guaranteed::NullObject.new.to_i)
  end

  def test_present_returns_false
    assert_equal(false, Guaranteed::NullObject.new.present?)
  end

  def test_empty_returns_true
    assert_equal(true, Guaranteed::NullObject.new.empty?)
  end

  def test_blank_returns_true
    assert_equal(true, Guaranteed::NullObject.new.blank?)
  end

  def test_not_returns_true
    assert_equal(true, !Guaranteed::NullObject.new)
  end

  def test_as_json_returns_nil
    assert_nil(Guaranteed::NullObject.new.as_json)
  end

  def test_to_json_returns_null
    assert_equal("null", Guaranteed::NullObject.new.to_json)
  end

  def test_tap_returns_self
    object = Guaranteed::NullObject.new
    assert_equal(true, object.tap { |o| o.foo = 'bar' }.nil?)
  end

  def test_persisted_returns_false
    assert_equal(false, Guaranteed::NullObject.new.persisted?)
  end
end