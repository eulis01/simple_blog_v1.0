require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# => needed to use patch, put or delete
use Rack::MethodOverride 

run ApplicationController
