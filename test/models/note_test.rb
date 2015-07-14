require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  def setup
    @note = Note.new(name: "Test Notw", url: "http://www.google.com", contents: "Ask this site if you have doubts")
  end

  test "should be valid" do
    assert @note.valid?
  end

  test "name should be present" do
    @note.name = "     "
    assert_not @note.valid?
  end

  test "url should be present" do
    @note.url = "     "
    assert_not @note.valid?
  end

  test "contents should be present" do
    @note.contents = "     "
    assert_not @note.valid?
  end

  test "name should not be too long" do
    @note.name = "a" * 51
    assert_not @note.valid?
  end

  test "url should not be too long" do
    @note.url = "a" * 256
    assert_not @note.valid?
  end

  test "name should be unique" do
    duplicate_note = @note.dup
    duplicate_note.name = @note.name.upcase
    @note.save
    assert_not duplicate_note.valid?
  end

end
