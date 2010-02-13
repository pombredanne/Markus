# Tests with MACHINIST

require File.join(File.dirname(__FILE__),'/../test_helper')
require File.join(File.dirname(__FILE__),'/../blueprints/blueprints')
require File.join(File.dirname(__FILE__), '..', 'blueprints', 'helper')
require 'shoulda'

class SectionTest < ActiveSupport::TestCase
  SHOW_GENERATED_DATA = false
  SHOW_DEPENDENCY_GENERATED_DATA = true

  def setup
    clear_fixtures
  end

  should_validate_presence_of :name
  should_have_many :students

  context "A section with no student associated to" do
    setup do 
      @section = Section.make
    end

    should "return false to has_students?" do
      assert !@section.has_students?
    end

    should "return 0 to count_student" do
      assert_equal 0, @section.count_students
    end
  end

  context "A section with students associated to" do
    setup do
      @section = Section.make
      3.times { @section.students.make }
    end

    should "return true to has_students?" do
      assert @section.has_students?
    end

    should "return 3 to students associated to" do
      assert_equal 3, @section.count_students
    end
  end


end



