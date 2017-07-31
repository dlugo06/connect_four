require 'bundler/setup'
require 'connect_four'
require 'stringio'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def suppress_stdout
    allow(STDOUT).to receive(:puts)
    logger = double('STDOUT').as_null_object
    allow(STDOUT).to receive(:new).and_return(logger)
  end

  def suppress_stdin(value)
    allow(STDIN).to receive(:gets).and_return value
  end
end
