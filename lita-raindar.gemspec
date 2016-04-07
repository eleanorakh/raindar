# # coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "lita-raindar"
  spec.version       = "1.0.0"
  spec.authors       = ["Eleanor Kiefel Haggerty"]
  spec.email         = ["eleanorakh@gmail.com"]

  spec.summary       = %q{A lita plugin that responds to requests to check the weather in Australia}
  spec.description   = %q{Lita chatbot reponds to user requests of 'weather LOCATION' with a GIF of the weather in specified location. Response is limited to Australian locations with a radar listed on the Bureau of Meteorology}
  spec.homepage      = "https://github.com/eleanorakh/raindar.git"
  spec.license       = "MIT"

  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = Dir.glob("{lib}/**/**/*")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "httparty"
  spec.add_dependency "imgur-api"
  spec.add_dependency "lita"
  spec.add_dependency "redis"
end
