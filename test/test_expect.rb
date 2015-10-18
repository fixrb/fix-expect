require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'fix', 'expect'
require 'spectus'

begin
  app = 6 * -7

  Fix.describe app do
    it { expect_block {}.not_to Equal: -42 }
    it { expect_block {}.not_to! Equal: -42 }

    it { MUST Equal: -42 }
    it { expect(app).to Equal: -42 }

    on :abs do
      it { MUST Equal: 42 }
      it { expect(:boom).to RaiseException: NoMethodError }
      it { expect(app).to Equal: 42 }
      it { expect_block { app }.to! Equal: 42 }
    end
  end
rescue SystemExit => e
  Spectus.this { e.success? }.MUST :BeTrue
end
