require 'rails_helper'

RSpec.describe List, type: :model do
  describe "#complete_all_tasks!" do
    it "should mark all tasks from the list as complete" do
      list = List.create(name: "Chores")
      task1 = Task.create(complete: false, list_id: list.id, name: "Take out trash")
      task2 = Task.create(complete: false, list_id: list.id, name: "Mow Lawn")
      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end
  describe "#snooze_all_tasks!" do
    it "should snooze each task" do
      my_deadline = Time.now
      list = List.create(name: "Chores 2.0")
      task3 = Task.create(deadline: my_deadline, list_id: list.id)
      task4 = Task.create(deadline: my_deadline, list_id: list.id)
      list.snooze_all_tasks!
      list.tasks.each do |task|
        expect(task.deadline).to eq(my_deadline + 1.hour)
      end
    end
  end
  describe "#total_duration" do
    it "should return the sum of the duration for all tasks" do
      list = List.create(name: "Chores 3.0")
      task3 = Task.create(duration: 50, list_id: list.id)
      task4 = Task.create(duration: 100, list_id: list.id)
      expect(list.total_duration).to eq(150)  
    end  
  end
  describe "#incomplete_tasks" do
    it "should return an array of incomplete tasks" do
      my_deadline = Time.now
      list = List.create(name: "Chores 2.0")
      task1 = Task.create(complete: true, list_id: list.id)
      task2 = Task.create(complete: false, list_id: list.id)
      task3 = Task.create(complete: false, list_id: list.id)
      expect(list.incomplete_tasks.length).to eq(2)
      list.incomplete_tasks.each do |task|
        expect(task.complete).to eq(false)
      end
    end
  end
  describe "#favorite_tasks" do
    it "should return an array of favorite tasks" do
      my_deadline = Time.now
      list = List.create(name: "Chores 2.0")
      task1 = Task.create(favorite: true, list_id: list.id)
      task2 = Task.create(favorite: false, list_id: list.id)
      task3 = Task.create(favorite: false, list_id: list.id)
      expect(list.favorite_tasks.length).to eq(1)
      list.favorite_tasks.each do |task|
        expect(task.favorite).to eq(true)
      end
    end
  end
end























