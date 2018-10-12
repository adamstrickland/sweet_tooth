require "open3"
require "fileutils"

APPS = %w[webapp]

def _docker_run(cmd=nil, services: APPS)
  services.each do |svc|
    system "docker-compose run #{svc} #{cmd}"
  end
end

def _run_command(cmd=nil, projects: APPS, &block)
  raise unless !cmd.nil? || block_given?

  closure = if block_given?
              block
            else
              ->(_){ cmd }
            end


  projects.each { |dir| _run_command_in dir, &closure }
end


def _run_command_in(dir, &block)
  File.expand_path(File.join(File.dirname(__FILE__), dir)).tap do |full_path|
    Dir.chdir(full_path) do
      cwd = Dir.getwd
      cmd = block.call(cwd)
      puts "Running \"#{cmd}\" in #{cwd}"

      Bundler.with_clean_env do
        system cmd
      end
    end
  end
end

task :build do
  _docker_run "yarn install", services: %w[master]
end

namespace :yarn do
  task :install do
    _docker_run "yarn install"
  end
end

namespace :bundle do
  namespace :install do
    task :local do
      _run_command "bundle install"
    end

    task :docker do
      _docker_run "bundle install"
    end
  end

  task :install => ["bundle:install:local", "bundle:install:docker"]
end

task :install => ["bundle:install", "yarn:install"]

namespace :db do
  def _run_in_dev_and_test(cmd)
    _run_command cmd
    _run_command "RAILS_ENV=test #{cmd}"
  end

  %i[setup migrate].each do |t|
    task t do
      _run_in_dev_and_test "bundle exec rake db:#{t.to_s}"
    end
  end
end

task :hack do |_t, args|
  _run_command args.extras
end
