require 'forwardable'

module Guaranteed
  # An implementation the Null Object pattern.
  #
  # Overrides some common Ruby and Rails methods to avoid continual
  #   type-checking. Delegates most of them to an intance of NilClass.
  class NullObject
    extend Forwardable

    def_delegators :value, :nil?, :to_a, :to_s, :to_f, :to_i, :to_h

    def persisted?
      false
    end

    def present?
      false
    end

    def empty?
      true
    end

    def blank?
      true
    end

    def tap
      self
    end

    def !
      true
    end

    def as_json(options = nil)
      nil
    end

    def to_json
      "null"
    end

    # Allows instances of the class to respond to any received message.
    #
    # Supports unlimited method chaining. Avoids NoMethodError in any
    #   part of the method chain.
    def method_missing(method_name, *args, &block)
      self
    end

    def respond_to_missing?(method_name, include_private = false)
      true
    end

    private

    def value
      nil
    end
  end
end