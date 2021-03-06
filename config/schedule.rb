# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "~/code/weatherapp/log/cron_log.log"

every 2.minutes do 
	rake "weather:update", environment => "development"
end

# to update cron job, run on terminal ===> whenever --update-crontab store
# 		* this tries to insert to production db

# To insert to dev db, on terminale 
		# ====> whenever --update-crontab --set environment=development

# to stop cron job, run on terminal ====> whenever -c store