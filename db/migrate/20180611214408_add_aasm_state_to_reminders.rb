class AddAasmStateToReminders < ActiveRecord::Migration[5.2]
  def change
    add_column :reminders, :aasm_state, :string
  end
end
