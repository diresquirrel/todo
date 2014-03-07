require 'spec_helper'

describe "lists/new" do
  before(:each) do
    assign(:list, stub_model(List,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new list form" do
    render

    assert_select "form[action=?][method=?]", lists_path, "post" do
      assert_select "input#list_title[name=?]", "list[title]"
    end
  end
end
