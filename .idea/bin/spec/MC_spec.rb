require 'rspec'
require 'rails_helper'
require 'airborne'
require 'mongo'

include Mongo

Airborne.configure do |config|
  config.base_url = 'http://kira-35411.herokuapp.com/api'
end

describe 'MasterCard' do

  it('should fill the fields for MC with EUR') {
    post '/payment', {:amount => '12', :currency => 'EUR', :fullName => 'Jake Solo', :firstName => 'Jake', :lastName => 'Solo', :cardNumber => '5110927212387377', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }

  it('should fill the fields for MC with USD') {
    post '/payment', {:amount => '12', :currency => 'USD', :fullName => 'Jake Solo', :firstName => 'Jake', :lastName => 'Solo', :cardNumber => '5110927212387377', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }

  it('should fill the fields for MC with AUD') {
    post '/payment', {:amount => '12', :currency => 'AUD', :fullName => 'Jake Solo', :firstName => 'Jake', :lastName => 'Solo', :cardNumber => '5110927212387377', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }
end
