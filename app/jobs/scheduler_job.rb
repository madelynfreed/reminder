class SchedulerJob < ActiveJob::Base
  def perform(reminder_id)
    reminder = Reminder.find(reminder_id)
    how_many_minutes = calculate_time_until(reminder)
    SchedulerWorker.perform_async(how_many_minutes, reminder_id)

  end

  private

  def calculate_time_until(reminder)
    1.minutes
  end

end
