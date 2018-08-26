# frozen_string_literal: true

require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'fix', 'expect'
require 'spectus'

include Spectus

begin
  app = 6 * -7

  Fix.describe app do
    it { expect_block {}.not_to equal(-42) }
    it { expect_block {}.not_to! equal(-42) } if Process.respond_to?(:fork)

    it { MUST equal(-42) }
    it { expect(app).to equal(-42) }
    it { is_expected.to equal(-42) }

    on :abs do
      it { MUST equal 42 }
      it { expect(app).to equal 42 }
      it { is_expected.to equal 42 }
      it { expect_block { app }.to! equal 42 } if Process.respond_to?(:fork)
      it { expect(:boom).to raise_exception NoMethodError }
    end
  end
rescue SystemExit => e
  it { e.success? }.MUST be_true
end
