class Reminder < ApplicationRecord
  include AASM

  aasm do
    state :created, :initial => true
    state :scheduled, :pushed, :acknowledged, :deleted

    event :schedule do
      transitions :from => :created, :to => :scheduled
    end

    event :push do
      transitions :from => :scheduled, :to => :pushed
    end

    event :acknowledge do
      transitions :from => :pushed, :to => :acknowledged
    end

    event :kill do
      transitions :from => [:created, :scheduled, :pushed, :acknowledged], :to => :deleted
    end
  end
end
