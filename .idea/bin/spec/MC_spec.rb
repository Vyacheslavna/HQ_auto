require 'rspec'
require 'rails_helper'
require 'airborne'
require 'mongo'

describe 'MasterCard' do

  it('should fill the fields for MC') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => :int, :currency => :string, :fullName => :string, :firstName => :string, :lastName => :string, :cardNumber => :string, :cardCVV => :int, :expireMonth => :int, :expireYear => :int}
  }

  it('should fill the fields for MC with EUR') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'EUR', :fullName => 'Jake Solo', :firstName => 'Jake', :lastName => 'Solo', :cardNumber => '5110927212387377', :cardCVV => 123},{:expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }

  it('should fill the fields for MC with USD') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'USD', :fullName => 'Jake Solo', :firstName => 'Jake', :lastName => 'Solo', :cardNumber => '5110927212387377', :cardCVV => 123},{:expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }

  it('should fill the fields for MC with AUD') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'AUD', :fullName => 'Jake Solo', :firstName => 'Jake', :lastName => 'Solo', :cardNumber => '5110927212387377', :cardCVV => 123},{:expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }
end
