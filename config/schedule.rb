# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
job_type :runner,  "cd :path && bin/rails runner -e development ':task' :output"
set :output, "#{path}/log/cron.log"
#
every 1.minute do
#  command "ls"
  runner "Room.delete_inactive_rooms"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
