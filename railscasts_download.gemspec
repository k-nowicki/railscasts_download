# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "railscasts_download/version"

Gem::Specification.new do |s|
  s.name        = "railscasts_download"
  s.version     = RailscastsDownload::VERSION
  s.authors     = ["k-nowicki"]
  s.email       = ["karol@knowicki.pl"]
  s.homepage    = ""
  s.summary     = %q{Download all revised and pro railscasts with oneline command!}
  s.description = %q{Download all revised and pro railscasts with oneline command.}

  s.rubyforge_project = "railscasts_download"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "mechanize"
  s.add_runtime_dependency "highline"
end
