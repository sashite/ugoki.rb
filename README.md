# Ugoki.rb

[![Build Status](https://travis-ci.org/sashite/ugoki.rb.svg?branch=master)](https://travis-ci.org/sashite/ugoki.rb)
[![Gem Version](https://badge.fury.io/rb/ugoki.svg)][gem]
[![Inline docs](https://inch-ci.org/github/sashite/ugoki.rb.svg?branch=master)][inchpages]
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Ugoki (動き) just returns all pseudo-legal moves from a tablebase and a position.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "ugoki"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ugoki --pre

## Example

Let's suppose that we want to return the list of pseudo-legal moves from the initial position of the game of Shogi.

First of all, we can install the [Shogi tablebase](https://github.com/sashite/pseudo_legal_move_tablebase-shogi.rb):

    $ gem install pseudo_legal_move_tablebase-shogi

And then, we can return all pseudo-legal moves:

```ruby
require "pseudo_legal_move_tablebase/shogi"
require "ugoki"

feen = "s:l,s:n,s:s,s:g,s:-k,s:g,s:s,s:n,s:l/1,s:r,5,s:b,1/s:p,s:p,s:p,s:p,s:p,s:p,s:p,s:p,s:p/9/9/9/S:P,S:P,S:P,S:P,S:P,S:P,S:P,S:P,S:P/1,S:B,5,S:R,1/S:L,S:N,S:S,S:G,S:-K,S:G,S:S,S:N,S:L 0 -"

Ugoki.pseudo_legal_moves(PseudoLegalMoveTablebase::Shogi::DB, feen)
# => #<Set: {[54, 45, "S:P", nil], [55, 46, "S:P", nil], [56, 47, "S:P", nil], [57, 48, "S:P", nil], [58, 49, "S:P", nil], [59, 50, "S:P", nil], [60, 51, "S:P", nil], [61, 52, "S:P", nil], [62, 53, "S:P", nil], [70, 69, "S:R", nil], [70, 68, "S:R", nil], [70, 67, "S:R", nil], [70, 66, "S:R", nil], [70, 65, "S:R", nil], [70, 71, "S:R", nil], [72, 63, "S:L", nil], [74, 65, "S:S", nil], [74, 66, "S:S", nil], [75, 65, "S:G", nil], [75, 66, "S:G", nil], [75, 67, "S:G", nil], [76, 66, "S:-K", nil], [76, 67, "S:-K", nil], [76, 68, "S:-K", nil], [77, 67, "S:G", nil], [77, 68, "S:G", nil], [77, 69, "S:G", nil], [78, 68, "S:S", nil], [78, 69, "S:S", nil], [80, 71, "S:L", nil]}>
```

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## About Sashite

This [gem](https://rubygems.org/gems/ugoki) is maintained by [Sashite](https://sashite.com/).

With some [lines of code](https://github.com/sashite/), let's share the beauty of Chinese, Japanese and Western cultures through the game of chess!

[gem]: https://rubygems.org/gems/ugoki
[inchpages]: https://inch-ci.org/github/sashite/ugoki.rb
[rubydoc]: https://rubydoc.info/gems/ugoki/frames
