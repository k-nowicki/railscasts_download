# -*- encoding : utf-8 -*-
require_relative 'test_helper'

#load all tests
Dir.glob( './**/*_test.rb' ).each { |test_file| require test_file }
