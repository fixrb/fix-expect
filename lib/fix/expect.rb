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
    # @param req [Hash, Symbol] The definition of the expected value.
    #
    # @return (see #requirement)
    def to(req)
      requirement(req, false).result
    end

    # Evaluate to a negative assertion.
    #
    # @param (see #to)
    #
    # @return (see #requirement)
    def not_to(req)
      requirement(req, true).result
    end

    # Evaluate to a positive assertion in isolation.
    #
    # @param (see #to)
    #
    # @return (see #requirement)
    def to!(req)
      requirement(req, false).result(true)
    end

    # Evaluate to a negative assertion in isolation.
    #
    # @param (see #to)
    #
    # @return (see #requirement)
    def not_to!(req)
      requirement(req, true).result(true)
    end

    private

    # High requirement level.
    #
    # @param req    [Hash, Symbol]  The definition of the expected value.
    # @param negate [Boolean]       Evaluate to a negative assertion.
    #
    # @return [Spectus::Result::Fail, Spectus::Result::Pass] Report if the spec
    #   pass or fail.
    def requirement(req, negate)
      Spectus::RequirementLevel::High.new(req, negate, @object, *@challenges)
    end
  end
end

require_relative 'it'
