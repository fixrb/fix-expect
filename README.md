# Fix::Expect

[![Build Status](https://api.travis-ci.org/fixrb/fix-expect.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/fix-expect/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/fix-expect.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/fix-expect.svg?branch=master)][inchpages]
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Provides the `expect` syntax.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fix-expect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fix-expect

## Usage

### The `expect` method

__Fix::Expect__ lets you express expected outcomes on an object, thanks to [Spectus](https://rubygems.org/gems/spectus)'s `MUST` and `MUST_NOT` requirement levels.

An **absolute requirement** example:

```ruby
Fix do
  it { expect(-42.abs).to equal 42 }
end
```

> (irb):2: Success: expected to equal 42.

An **absolute prohibition** example:

```ruby
Fix do
  it { expect(-42).not_to equal 42 }
end
```

> (irb):5: Success: expected -42 not to equal 42.

Thus, rather than inferring the actual value (which is `41.next`) from the context
and calculating its value (which is `42`),

rather than letting Fix's default behavior define and compute `41.next` as the actual value to challenge,
the `expect` method short circuit it with its argument.

These 2 examples are equivalent:

```ruby
Fix 41 do
  on :next do
    it { MUST equal 42 }
    it { expect(41.next).to equal 42 }
  end

  it { MUST equal 41 }
  it { expect(41.next).to equal 42 }
end
```

> (irb):9: Success: expected to equal 42.
> (irb):10: Success: expected to equal 42.
> (irb):13: Success: expected to equal 41.
> (irb):14: Success: expected to equal 42.

The block syntax is also allowed:

```ruby
Fix do
  it { expect { -42.abs }.to equal 42 }
end
```

> (irb):2: Success: expected to equal 42.

```ruby
Fix do
  it { expect { 4 / 0 }.to raise_exception ZeroDivisionError }
end
```

> (irb):5: Success: divided by 0.

### The `is_expected` method

For convenience, an `is_expected` method is provided,
as an alias of Spectus's [MUST](https://github.com/fixrb/spectus#absolute-requirement):

```ruby
Fix 41 do
  on :next do
    it { is_expected.to equal 42 }
  end
end
```

> (irb):3: Success: expected to equal 42.

### Code Isolation

When executing expectations, side-effects may occur.
Because they may or may not be desired, each requirement level has 2 versions:

* if it is performed with `do`, a test is performed without isolation;
* if it is performed with `do!`, a test is performed in isolation.

Example of test without isolation:

```ruby
greeting = 'Hello, world!'

Fix do
  it 'tests without isolation' do
    expect { greeting.gsub!('world', 'Alice') }.to equal 'Hello, Alice!'
  end
end

greeting # => "Hello, Alice!"
```

Example of test in isolation:

```ruby
greeting = 'Hello, world!'

Fix do
  it 'tests with isolation' do
    expect { greeting.gsub!('world', 'Alice') }.to! equal 'Hello, Alice!'
  end
end

greeting # => "Hello, world!"
```

## Contact

* Source code: https://github.com/fixrb/fix-expect

## Versioning

__Fix::Expect__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/fix-expect/raw/master/img/sashite.png"
    alt="Sashite" /></a>
</p>

[gem]: https://rubygems.org/gems/fix-expect
[travis]: https://travis-ci.org/fixrb/fix-expect
[codeclimate]: https://codeclimate.com/github/fixrb/fix-expect
[inchpages]: https://inch-ci.org/github/fixrb/fix-expect
[rubydoc]: https://rubydoc.info/gems/fix-expect/frames
