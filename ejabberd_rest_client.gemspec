Gem::Specification.new do |s|
  s.name = %q{ejabberd_rest_client}
  s.version = "0.0.1"
  s.date = %q{2018-06-13}
  s.summary = %q{REST client for ejabberd}
  s.author = "Boris Chernov"
  s.files = [
    "lib/ejabberd_rest_client.rb"
  ]
  s.require_paths = ["lib"]
  s.add_dependency("json", '~> 2.1', '>= 2.1.0')
  s.extra_rdoc_files = ["README.md"]
end
