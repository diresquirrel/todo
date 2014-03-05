# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "Test my awesome todo app"
    notes "This task has a place to take notes. Use them to keep track of additional information."
  end
end
