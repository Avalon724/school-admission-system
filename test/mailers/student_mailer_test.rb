require "test_helper"

class StudentMailerTest < ActionMailer::TestCase
  test "student_added" do
    mail = StudentMailer.student_added
    assert_equal "Student added", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
