require 'active_tax'
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new(color: true)
# (
#   Minitest::Reporters::ProgressReporter.new,
#   ENV,
#   Minitest.backtrace_filter
# )


