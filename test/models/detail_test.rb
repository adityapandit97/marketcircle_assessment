require "test_helper"

class DetailTest < ActiveSupport::TestCase
  test "should belong to person" do
    person = Person.create(name: "John Doe")
    detail = Detail.new(person: person, email: "john@example.com")
    
    assert_equal person, detail.person
  end

  test "should validate presence of email" do
    detail = Detail.new
    assert_not detail.save, "Saved the detail without an email"
    assert_includes detail.errors.full_messages, "Email can't be blank"
  end
end
