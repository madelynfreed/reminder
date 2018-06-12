class SchedulerWorker
  include Sidekiq::Worker

  def perform(time_until, reminder_id)
    # Do something
    reminder = Reminder.find(reminder_id)
    reminder.schedule!
  end
end
