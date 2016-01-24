class TwimlController < ApplicationController
  before_filter :authenticate_twilio
  layout false
  
  def start
  end
  
  def read_fizzbuzz
    @fizzbuzz_string = ""
    upper_bound = params[:Digits].to_i
    upper_bound.times do |i|
      partial_string = ""
      
      divisible_by_three = (i + 1) % 3 == 0
      divisible_by_five = (i + 1) % 5 == 0
      
      partial_string += "Fizz " if divisible_by_three
      partial_string += "Buzz " if divisible_by_five
      partial_string += (i + 1).to_s if partial_string.empty?
      partial_string += ", " unless i == upper_bound - 1
      
      @fizzbuzz_string += partial_string
    end
  end
  
end