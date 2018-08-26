# frozen_string_literal: true

# Namespace for the Fix framework.
#
# @api public
#
module Fix
  # Expect's class.
  #
  class Expect
    # Initialize the expect class.
    #
    # @param object     [#object_id]  The object to test.
    # @param challenges [Array]       A list of challenges.
    def initialize(object, *challenges)
      @object     = object
      @challenges = challenges
    end

    # Evaluate to a positive assertion.
    #
    # @param m [#matches?] The matcher.
    #
    # @return (see #requirement)
    def to(m)
      requirement(m, false).result
    end

    # Evaluate to a negative assertion.
    #
    # @param (see #to)
    #
    # @return (see #requirement)
    def not_to(m)
      requirement(m, true).result
    end

    # Evaluate to a positive assertion in isolation.
    #
    # @param (see #to)
    #
    # @return (see #requirement)
    def to!(m)
      requirement(m, false).result(true)
    end

    # Evaluate to a negative assertion in isolation.
    #
    # @param (see #to)
    #
    # @return (see #requirement)
    def not_to!(m)
      requirement(m, true).result(true)
    end

    private

    # High requirement level.
    #
    # @param m      [#matches?] The matcher.
    # @param negate [Boolean]   Evaluate to a negative assertion.
    #
    # @return [Spectus::Result::Fail, Spectus::Result::Pass] Report if the spec
    #   pass or fail.
    def requirement(m, negate)
      Spectus::RequirementLevel::High.new(m, negate, @object, *@challenges)
    end
  end
end

require_relative 'it'
