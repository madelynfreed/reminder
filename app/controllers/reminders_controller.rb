class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def pending
    @reminders = Reminder.where(aasm_state: 'pushed')
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    if @reminder.save
      flash[:success] = "u saved it"
      SchedulerJob.perform_now(@reminder.id)
      redirect_to @reminder
    else
      render 'new'
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.kill!
    @reminder.destroy

    flash[:success] = "u killed it"

    redirect_to reminders_path
  end

  private

  def reminder_params
    params.require(:reminder).permit(:content, :time)
  end
end
