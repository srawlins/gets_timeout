GetsTimeout
===========

GetsTimeout is a very simple module that allows a timeout on a gets request
(for now specifically from STDIN. Perhaps support for more in the future.).

About
-----

version 1.0.0
Sam Rawlins is sam dot rawins at gmail dot com
http://github.com/srawlins

Dependencies
------------

I am fairly certain this gem only works in (MRI) Ruby 1.9+.
* (MRI) Ruby 1.8.x, especially on Windows, blocks on #gets
  (so no other threads are scheduled).
* JRuby?
* etc.?

Usage
-----

Just `require 'gets_timeout'`
and mix-into a class if you like. Call `GetsTimeout.gets_timeout(seconds)`,
specifying the number of seconds to wait until timing out on an answer.
For example:

<pre><code>require 'gets_timeout'
file = ARGV.shift
print "This script will delete #{file}. "
print "Are you sure you want to continue? [yes/no] (default no): "
continue = GetsTimeout.gets_timeout(10) || "no"
abort "Aborted" unless continue == "yes"
FileUtils.rm(file)</code></pre>

Tests
-----

Um... next version.
