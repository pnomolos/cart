# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cart}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["botanicus"]
  s.date = %q{2009-04-16}
  s.description = %q{Cart is framework agnostic solution for shopping cart.}
  s.email = %q{pnomolos@gmail.com}
  s.files = ["LICENSE","Rakefile","README.textile","lib/cart/advanced.rb","lib/cart/config.rb","lib/cart/logger_stub.rb","lib/cart/simple.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/botanicus/cart}
  # s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  # s.rubyforge_project = nil
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Cart is framework agnostic solution for shopping cart.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 1.15"])
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.2"])
    else
      s.add_dependency(%q<mime-types>, [">= 1.15"])
      s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 1.15"])
    s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
  end
end
