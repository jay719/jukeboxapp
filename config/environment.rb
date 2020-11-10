require 'bundler/setup'
Bundler.require

require_all 'app'
ActiveRecord::Base.logger.level = 1