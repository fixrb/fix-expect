require 'fix'

# Namespace for the Fix framework.
#
module Fix
  # Wraps the target of an expectation.
  #
  class It
    # Create a new expection target given an object.
    #
    # @param object [#object_id] An object to test.
    #
    # @return [Expect] An expect instance.
    def expect(object)
      Expect.new(object, *challenges)
    end

    # Create a new expection target given a block.
    #
    # @param block [Proc] A code to test.
    #
    # @return [Expect] An expect instance.
    def expect_block(&block)
      Expect.new(block, *([block_challenge] + challenges))
    end

    # rubocop:disable PredicateName

    # Create a new expection target given the subject.
    #
    # @return [Expect] An expect instance.
    def is_expected
      Expect.new(subject, *challenges)
    end
  end
end
