require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "should have one detail and destroy it when person is destroyed" do
    person = Person.create(name: "John Doe")
    detail = Detail.create(person: person, email: "john@example.com", phone: "1234567890", title: "Developer", age: 30)
    
    assert_equal person.detail, detail

    assert_difference('Detail.count', -1) do
      person.destroy
    end
  end

  test "should validate presence of name" do
    person = Person.new
    assert_not person.save, "Saved the person without a name"
    assert_includes person.errors.full_messages, "Name can't be blank"
  end
end
