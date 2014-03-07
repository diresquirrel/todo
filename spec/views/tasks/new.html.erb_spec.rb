require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :title => "MyString",
      :notes => "MyText",
      :complete => false
    ).as_new_record)
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "input#task_title[name=?]", "task[title]"
      assert_select "textarea#task_notes[name=?]", "task[notes]"
      assert_select "input#task_complete[name=?]", "task[complete]"
    end
  end
end
