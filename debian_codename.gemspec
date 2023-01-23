Gem::Specification.new do |spec|
  spec.name = 'debian_codename'
  spec.version = %x(git describe --tags).tr('-', '.').chomp
  spec.authors = ['Puppet Release Engineering']
  spec.email = ['release@puppet.com']

  spec.summary = 'Convert Debian/Ubuntu codenames to version numbers and vice-versa'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/puppetlabs/debian_codename'
  spec.required_ruby_version = '>= 2.4.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['lib/*']
end
