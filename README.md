# capistrano-god
# Capistrano3 God

This is a capistrano v3 plugin that deploys and compiles your .god.erb files. It will look for scripts in config/god/#{role}, compile them and deploy them to god_deploy_dir

### Conventions

You can override the defaults by `set :god_roles, [:app,:web]` in the `config/deploy.rb` or `config/deploy/ENVIRONMENT.rb` capistrano deployment files.

- `:god_deploy_dir`

    Default to #{release_path}/config/god/deploy/, will be created if not existing

- `:god_variables`

    List of custom variables passed to .erb files


### Setup

Add the library to your `Gemfile`:

```ruby
group :development do
  gem 'capistrano-god', github: "http://github.com/77agency/capistrano-god"
end
```

Add the library to your `Capfile`:

```ruby
require 'capistrano/god'
```

Invoke god task from your `config/deploy.rb` or `config/deploy/ENVIRONMENT.rb`:


```ruby
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'god:deploy'
  end
end
```
