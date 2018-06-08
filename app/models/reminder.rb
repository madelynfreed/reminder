class Reminder < ApplicationRecord
  include AASM

  aasm do
    state :created, :initial => true
    state :scheduled, :sent, :acknowledged, :deleted

    event :schedule do
      transitions :from => :created, :to => :scheduled
    end

    event :send do
      transitions :from => :scheduled, :to => :sent
    end

    event :acknowledge do
      transitions :from => :sent, :to => :acknowledged
    end

    event :delete do
      transitions :from => [:created, :scheduled, :sent, :acknowledged], :to => :deleted
    end
  end
end
