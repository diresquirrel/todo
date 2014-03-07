require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :title => "MyString",
      :notes => "MyText",
      :complete => false
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_title[name=?]", "task[title]"
      assert_select "textarea#task_notes[name=?]", "task[notes]"
      assert_select "input#task_complete[name=?]", "task[complete]"
    end
  end
end
