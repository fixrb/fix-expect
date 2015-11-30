# Fix::Expect

[![Build Status](https://travis-ci.org/fixrb/fix-expect.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/fix-expect/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/fix-expect.svg)][gem]
[![Inline docs](http://inch-ci.org/github/fixrb/fix-expect.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Provides the `expect` syntax.

## Contact

* Home page: https://github.com/fixrb/fix-expect
* Bugs/issues: https://github.com/fixrb/fix-expect/issues
* Support: https://stackoverflow.com/questions/tagged/fixrb

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](http://rubini.us/)
* [JRuby](http://jruby.org/)

## Installation

__Fix::Expect__ is cryptographically signed.

To be sure the gem you install hasn't been tampered with, add my public key (if you haven't already) as a trusted certificate:

    $ gem cert --add <(curl -Ls https://raw.github.com/fixrb/fix-expect/master/certs/gem-fixrb-public_cert.pem)
    $ gem install fix-expect -P HighSecurity

The `HighSecurity` trust profile will verify all gems.  All of __Fix::Expect__'s dependencies are signed.

Or add this line to your application's Gemfile:

```ruby
gem 'fix-expect'
```

And then execute:

    $ bundle

## Usage

__Fix::Expect__ lets you express expected outcomes on an object:

```ruby
expect(value.abs).to equal 42 # => MUST equal 42
```

Both `expect` and `expect_block` methods are mapped to Spectus's [absolute requirement](https://github.com/fixrb/spectus#absolute-requirement)/[prohibition](https://github.com/fixrb/spectus#absolute-prohibition) to express expectations:

```ruby
Fix.describe 6 * 7 do
  it { expect_block { subject.class }.to equal Fixnum }
  it { expect(subject.class).to equal Fixnum }
end

# ..
#
# Ran 2 tests in 0.000327 seconds
# 100% compliant - 0 infos, 0 failures, 0 errors
```

Using those methods, the default inherited subject can be overridden by the given expected object/block:

```ruby
Fix.describe -6 * 7 do
  on :abs do
    # test against the described front object:
    it { MUST_NOT equal 1 }

    # another test against -1 object:
    it { expect(-1).to equal 1 }
  end
end

# ..
#
# Ran 2 tests in 0.000372 seconds
# 100% compliant - 0 infos, 0 failures, 0 errors
```

However, the tree of challenges remains the same.

For convenience, the `is_expected` method is also provided:

```ruby
Fix.describe -6 * 7 do
  on :abs do
    # test against the described front object:
    it { is_expected.to equal 42 }
  end
end

# .
#
# Ran 1 tests in 0.000176 seconds
# 100% compliant - 0 infos, 0 failures, 0 errors
```

## Security

As a basic form of security __Fix::Expect__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` expect.  For
example:

    $ sha512sum pkg/fix-expect-0.1.0.gem
    26198b7812a5ac118a5f2a1b63927871b3378efb071b37abb7e1ba87c1aac9f3a6b45eeae87d9dc647b194c15171b13f15e46503a9a1440b1233faf924381ff5  pkg/fix-expect-0.1.0.gem

## Versioning

__Fix::Expect__ follows [Semantic Versioning 2.0](http://semver.org/).

## Contributing

1. [Fork it](https://github.com/fixrb/fix-expect/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.

[gem]: https://rubygems.org/gems/fix-expect
[travis]: https://travis-ci.org/fixrb/fix-expect
[codeclimate]: https://codeclimate.com/github/fixrb/fix-expect
[inchpages]: http://inch-ci.org/github/fixrb/fix-expect
[rubydoc]: http://rubydoc.info/gems/fix-expect/frames

***

This project is sponsored by:

[![Sashite](http://www.sashite.com/assets/img/sashite.png)](http://www.sashite.com/)
