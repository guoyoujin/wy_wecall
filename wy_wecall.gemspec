require_relative 'lib/wy_wecall/version'

Gem::Specification.new do |spec|
  spec.name          = "wy_wecall"
  spec.version       = WyWecall::VERSION
  spec.authors       = ["TryCatch"]
  spec.email         = ["guoyoujin123@gmail.com"]

  spec.summary       = %q{支持网易云商智能外呼的 Ruby Api 客户端}
  spec.description   = %q{支持网易云商智能外呼的 Ruby Api客户端}
  spec.homepage      = "https://rubygems.org/gems/wy_wecall"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/guoyoujin/wy_wecall"
  spec.metadata["changelog_uri"] = "https://github.com/guoyoujin/wy_wecall"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "faraday", "~> 1.8.0"
  spec.add_dependency "faraday_middleware", "~> 1.2.1"
end
