require 'guaranteed/null_object'

module Guaranteed
  # Ensures there is an object we can confidently pass messages to.
  #
  # @param value an object, instance of any class
  # @return the same object or a NullObject for instances of NilClass.
  def self.Object(value = nil)
    case value
    when nil
      NullObject.new
    else
      value
    end
  end
end