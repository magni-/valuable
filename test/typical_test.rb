$: << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'test/unit'
require 'valuable.rb'
require 'date'
require 'mocha'

class Person < Valuable
  has_value :dob, :klass => :date
end

class TypicalTest < Test::Unit::TestCase

  def test_that_dates_can_be_set_directly
    born_on = Date.civil(1976, 07, 26)
    me = Person.new( :dob => born_on )
    assert_equal( born_on, me.dob )
  end

  def test_that_dates_are_parsed_from_strings
    neil_born_on = 'August 5, 1930'
    neil = Person.new( :dob => neil_born_on )
    assert_equal( Date.civil( 1930, 8, 5 ), neil.dob )
  end

  def test_that_a_date_might_not_be_set_yet_and_that_can_be_ok
    dr_who = Person.new( :dob => nil )
    assert_nil( dr_who.dob )
  end
end
