require 'guaranteed/null_object'

module Guaranteed
  def self.Object(value = nil)
    case value
    when nil
      NullObject.new
    else
      value
    end
  end
end