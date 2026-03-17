require File.expand_path(File.dirname(__FILE__) + '/neo')

class MyKoans < Neo::Koan
  def test_new_koans_can_be_created
    assert false # change
  end

  def test_variables_can_change_value_and_type
    some_variable = 5
    assert_equal __, some_variable
    assert_equal __, some_variable.class

    some_variable = [51, 4]
    assert_equal __, some_variable
    assert_equal __, some_variable.class
  end

  def test_all_objects_can_be_checked_for_nil
    some_object = 5
    assert_equal __, some_object.nil?

    some_object = nil
    assert_equal __, some_object.nil?
  end

  def test_blocks_can_be_passed_without_saving
    array = [:wizard, 42, "Trady Blix", 3, true, 19, 12.345]
    ints = array.select { |value| value.is_a?(Integer) }

    assert_equal __, ints
  end

  def test_blocks_can_be_saved_as_proc
    numbers = [23, 101, 7, 104, 11]
    under_100 = proc { |number| number < 100 }
    small = numbers.select(&under_100)

    assert_equal __, small
  end

  def test_blocks_can_be_saved_as_lambda
    numbers = [23, 101, 7, 104, 11]
    under_100 = lambda { |number| number < 100 }
    small = numbers.select(&under_100)

    assert_equal __, small
  end

  def test_usually_there_is_no_difference_between_using_proc_and_lambda
    numbers = [23, 101, 7, 104, 11]
    under_100_proc = proc { |number| number < 100 }
    under_100_lambda = lambda { |number| number < 100 }
    small_proc = numbers.select(&under_100_proc)
    small_lambda = numbers.select(&under_100_lambda)

    assert_equal __, small_proc == small_lambda
  end

  def test_there_is_a_difference_when_given_wrong_number_of_arguments
    return_something_proc = proc { |something| something }
    return_something_lambda = lambda { |something| something }

    assert_equal __, return_something_proc.call
    assert_raise(__) do
      return_something_lambda.call
    end
  end

  def test_also_there_is_a_difference_in_return_behavior
    def position_with_proc
      i_here = proc { return "Inside proc" }
      i_here.call
      "Inside method"
    end

    assert_equal __, position_with_proc

    def position_with_lambda
      i_here = -> { return "Inside lambda" }
      i_here.call
      "Inside method"
    end

    assert_equal __, position_with_lambda
  end

  def test_both_proc_and_lambda_can_be_passed_to_a_method
    def my_method(&bloc)
      bloc.call
    end

    my_proc = proc { "Inside proc" }
    my_lambda = lambda { "Inside lambda" }

    assert_equal __, my_method(&my_proc)
    assert_equal __, my_method(&my_lambda)
  end
end
