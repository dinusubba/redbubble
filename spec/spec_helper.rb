require './application.rb'

RSpec.configure do |config|
  config.after(:all) do
    FileUtils.rm_rf('./test_html')
  end
end
