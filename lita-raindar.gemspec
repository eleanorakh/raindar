# # coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "lita-raindar"
  spec.version       = "1.0.0"
  spec.authors       = ["Eleanor Kiefel Haggerty"]
  spec.email         = ["eleanorakh@gmail.com"]

  spec.summary       = %q{A slackbot that posts a GIF of the most recent weather radar of a given location in Australia}
  spec.description   = %q{Response is limited to locations around Australia that have a radar}
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
