# frozen_string_literal: true

require_relative 'lib/create_or_update/version'

Gem::Specification.new do |spec|
  spec.name = 'create_or_update'
  spec.version = CreateOrUpdate::VERSION
  spec.authors = ['tracy loisel']
  spec.email = ['tracy.loisel@gmail.com']

  spec.summary = 'Add class method create_or_update to any Active Record models'
  spec.description = 'Allow to create or update a record using .create_or_update(params)'
  spec.homepage = 'https://github.com/wemind-tech/create_or_update'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://github.com/wemind-tech/create_or_update/tree/main'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/wemind-tech/update_or_create'
  spec.metadata['changelog_uri'] = 'https://github.com/wemind-tech/create_or_update/blob/main/CHANGELOG.md'

  spec.add_development_dependency 'activerecord', '>= 5.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'sqlite3'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
