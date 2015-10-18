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
  end
end
