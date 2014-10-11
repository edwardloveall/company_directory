require 'rake'

task deploy: 'deploy:staging'

namespace :deploy do
  desc 'Deploy to Heroku staging'
  task :staging do
    Deployer.new('staging').deploy
  end

  desc 'Deploy to Heroku production'
  task :production do
    Deployer.new('production').deploy
  end
end

class Deployer
  def initialize(environment)
    @environment = environment
  end

  def deploy
    push_heroku
    maintenance do
      migrate_database
      restart
    end
  end

  private

  def push_heroku
    run "git push #{@environment} master"
  end

  def maintenance
    run "bundle exec heroku maintenance:on --remote #{@environment}"
    yield
    run "bundle exec heroku maintenance:off --remote #{@environment}"
  end

  def migrate_database
    run "bundle exec heroku run rake db:migrate --remote #{@environment}"
  end

  # def refresh_paperclip
  #   ['ProductImage'].map do |model_name|
  #     run "bundle exec heroku run rake paperclip:refresh CLASS=#{model_name} --remote #{@environment}"
  #   end
  # end

  # def notify_airbrake
  #   run "bundle exec rake airbrake:deploy TO=#{@environment}"
  # end

  def restart
    run "bundle exec heroku restart --remote #{@environment}"
  end

  def clear_cache
    run "bundle exec heroku run rake cache:clear --remote #{@environment}"
  end

  def production?
    @environment == 'production'
  end

  def run(command)
    puts "  #{command}"
    %x{#{command}}
  end
end
