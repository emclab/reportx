module Reportx
  class Engine < ::Rails::Engine
    isolate_namespace Reportx
    
    config.generators do |g|
      g.template_engine :erb
      g.integration_tool :rspec
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => "spec/factories"  
    end   
  end
end
