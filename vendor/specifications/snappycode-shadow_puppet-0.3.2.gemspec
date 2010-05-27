# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{snappycode-shadow_puppet}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jesse Newland"]
  s.date = %q{2009-12-15}
  s.default_executable = %q{shadow_puppet}
  s.description = %q{A Ruby Puppet DSL}
  s.email = ["jesse@railsmachine.com"]
  s.executables = ["shadow_puppet"]
  s.extra_rdoc_files = ["README.rdoc", "bin/shadow_puppet"]
  s.files = ["README.rdoc", "LICENSE", "bin/shadow_puppet", "examples/foo.rb", "lib/shadow_puppet.rb", "lib/shadow_puppet/manifest.rb", "lib/shadow_puppet/core_ext.rb", "lib/shadow_puppet/test.rb"]
  s.homepage = %q{http://railsmachine.github.com/shadow_puppet}
  s.rdoc_options = ["--main", "README.rdoc", "--inline-source", "--webcvs=http://github.com/railsmachine/shadow_puppet/tree/master/"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{moonshine}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A Ruby Puppet DSL}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<puppet>, ["= 0.24.8"])
      s.add_runtime_dependency(%q<facter>, [">= 1.5.4"])
      s.add_runtime_dependency(%q<highline>, [">= 1.5.0"])
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.0"])
    else
      s.add_dependency(%q<puppet>, ["= 0.24.8"])
      s.add_dependency(%q<facter>, [">= 1.5.4"])
      s.add_dependency(%q<highline>, [">= 1.5.0"])
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<activesupport>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<puppet>, ["= 0.24.8"])
    s.add_dependency(%q<facter>, [">= 1.5.4"])
    s.add_dependency(%q<highline>, [">= 1.5.0"])
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<activesupport>, [">= 2.0.0"])
  end
end
