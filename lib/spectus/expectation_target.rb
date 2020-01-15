# frozen_string_literal: true

require 'spectus'

module Spectus
  class ExpectationTarget
    alias to MUST
    alias to! MUST!
    alias not_to MUST_NOT
    alias not_to! MUST_NOT!
  end
end
