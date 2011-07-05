# Subelsky Power Tools Gem

This is a collection of Ruby extensions and utilities I've been carting around from project to project. 
Many are taken from the [Facets](http://rubyworks.github.com/facets/) project (I just don't want to
include that whole gem in my codebases).

The name is a tribute to [Topfunky Power Tools](http://topfunky.net/svn/plugins/topfunky_power_tools/).

# Installation

    gem install subelsky_power_tools

# Usage

The gem does not automatically require anything, so you can pick and choose which extensions get
added, by requiring them individually, e.g.:

    require 'subelsky_power_tools/ext/hash'
    require 'subelsky_power_tools/ext/exception'

See the individual extensions in `lib` or their tests in the `spec` directory.

# Problems? Questions?

Email <mike@subelsky.com> or file an issue on [GitHub](https://github.com/subelsky/subelsky_power_tools). Thanks!
