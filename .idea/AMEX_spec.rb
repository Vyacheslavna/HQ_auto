require 'rspec'
require 'rails_helper'
require 'airborne'
require 'mongo'

describe 'AMEX' do

  it('should fill the fields') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => :int, :currency => :string, :fullName => :string, :firstName => :string, :lastName => :string, :cardNumber => :string, :cardCVV => :int, :expireMonth => :int, :expireYear => :int}
  }

  it('should fill the fields with EUR') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'EUR', :fullName => 'Jane Morales', :firstName => 'Jane', :lastName => 'Morales', :cardNumber => '377127687066544', :cardCVV => 123},{:expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }

  it('should fill the fields with USD') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'USD', :fullName => 'Jane Morales', :firstName => 'Jane', :lastName => 'Morales', :cardNumber => '377127687066544', :cardCVV => 123},{:expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }

  it('should fill the fields with AUD') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'AUD', :fullName => 'Jane Morales', :firstName => 'Jane', :lastName => 'Morales', :cardNumber => '377127687066544', :cardCVV => 123},{:expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }
end
