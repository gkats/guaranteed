require 'forwardable'

module Guaranteed
  class NullObject
    extend Forwardable

    def_delegators :value, :nil?, :to_a, :to_s, :to_f, :to_i, :to_h

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