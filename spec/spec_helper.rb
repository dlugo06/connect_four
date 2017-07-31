require 'bundler/setup'
require 'connect_four'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def suppress_stdout
    allow(STDOUT).to receive(:puts) # this disables puts
    logger = double('STDOUT').as_null_object
    allow(STDOUT).to receive(:new).and_return(logger)
  end
end
