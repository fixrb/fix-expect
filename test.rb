# frozen_string_literal: true

require 'simplecov'

SimpleCov.start

require_relative File.join('lib', 'fix', 'expect')
require 'spectus'

include Spectus

begin
  app = 41

  Fix app do
    it { expect {}.not_to equal(42) }
    it { expect {}.not_to! equal(42) } if Process.respond_to?(:fork)

    it { MUST equal(41) }
    it { expect(app).to equal(41) }
    it { is_expected.to equal(41) }

    on :next do
      it { MUST equal 42 }
      it { expect(app).to equal 41 }
      it { is_expected.to equal 42 }
      it { expect { app }.to! equal 41 } if Process.respond_to?(:fork)
      it { expect { 4 / 0 }.to raise_exception ZeroDivisionError } if Process.respond_to?(:fork)
    end
  end
rescue SystemExit => e
  it { e.success? }.MUST be_true
end
