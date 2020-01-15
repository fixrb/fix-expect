# frozen_string_literal: true

require 'fix'

# Namespace for the Fix framework.
#
module Fix
  # Wraps the target of a Spectus expectation.
  class Expect < ::Spectus::ExpectationTarget
    # Create a new expection target
    #
    # @param callable [#call] The object to test.
    def initialize(callable)
      @callable = callable
    end
  end

  # Wraps the target of a Fix expectation.
  class It
    # Create a new expection target given an object.
    #
    # @param object [#object_id] An object to test.
    #
    # @return [Expect] An expect instance.
    def expect(object = nil, &block)
      if block_given?
        ::Fix::Expect.new(block)
      else
        ::Fix::Expect.new(::Defi.send(:itself).to(object))
      end
    end

    # rubocop:disable PredicateName

    # Create a new expection target given the subject.
    #
    # @return [Expect] An expect instance.
    def is_expected
      ::Fix::Expect.new(callable)
    end
    # rubocop:enable PredicateName
  end
end

# require_relative 'expect' unless defined?(::Fix::Expect)
require_relative '../spectus/expectation_target'
