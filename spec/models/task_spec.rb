require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "#toggle_complete!" do
    it "should switch complete to false if it began as true" do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it began as false" do
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end
  describe "#toggle_favorite!" do
    it "should switch favorite to false if it began as true" do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
    it "should switch favorite to true if it began as false" do
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end
  describe "#overdue?" do
    it "should return true if the current time is passed the deadline" do
      task = Task.new(deadline: "3/3/2016")
      expect(task.overdue?).to eq(true)
    end
    it "should return false if the current time is not passed the deadline" do
      task = Task.new(deadline: 10.days.from_now)
      expect(task.overdue?).to eq(false)
    end
  end
  describe "#increment_priority!" do
    it "if priority is less than 10, it should increase the priority by one" do
      task = Task.new(priority: 5)
      task.increment_priority!
      expect(task.priority).to eq(6)
    end
  end
  describe "#decrement_priority!" do
    it "if priority is greater than 10, it should decrease the priority by one" do
      task = Task.new(priority: 5)
      task.decrement_priority!
      expect(task.priority).to eq(4)
    end
  end
  describe "#sooze_hour" do
    it "should push off the deadline by one hour" do
      my_deadline = Time.now
      task = Task.new(deadline: my_deadline)
      task.snooze_hour!
      expect(task.deadline).to eq(my_deadline + 1.hour)
    end
  end
end





















