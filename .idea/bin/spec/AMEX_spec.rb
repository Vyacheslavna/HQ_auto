require 'rspec'
require 'rails_helper'
require 'airborne'
require 'mongo'

include Mongo

Airborne.configure do |config|
  config.base_url = 'http://kira-35411.herokuapp.com/api'
end

describe 'AMEX' do

  it('should fill the fields with EUR') {
    post '/payment', {:amount => '12', :currency => 'EUR', :fullName => 'Jane Morales', :firstName => 'Jane', :lastName => 'Morales', :cardNumber => '377127687066544', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }

  it('should fill the fields with USD') {
    post '/payment', {:amount => '12', :currency => 'USD', :fullName => 'Jane Morales', :firstName => 'Jane', :lastName => 'Morales', :cardNumber => '377127687066544', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }

  it('should fill the fields with AUD') {
    post '/payment', {:amount => '12', :currency => 'AUD', :fullName => 'Jane Morales', :firstName => 'Jane', :lastName => 'Morales', :cardNumber => '377127687066544', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }
end
