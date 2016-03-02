require 'rspec'
require 'rails_helper'
require 'airborne'
require 'mongo'

include Mongo

describe 'VISA' do

  it('should fill the fields') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => :int, :currency => :string, :fullName => :string, :firstName => :string, :lastName => :string, :cardNumber => :string, :cardCVV => :int, :expireMonth => :int, :expireYear => :int}
  }

  it('should fill the fields with EUR') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'EUR', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => 123, :expireMonth => 3, :expireYear => 2021}
    expect_status(201)

    client_hq = Mongo::Client.new(['ds059155.mongolab.com:59155'], :database => 'heroku_9zz9bm0g', :user => 'heroku_9zz9bm0g', :password => '9qtdvpu61se7usccbh2n3jd103')
    db_hq = client_hq.database
    coll_hq = db_hq.collection(db_hq)
    gateway_check = coll_hq.find(_id: 0, gateway: 1).sort({_id:-1}).limit(1)
    
    if gateway_check == "Paypal"
      print("Correct")
    else
      print("Test failed")
    end
  }

  it('should fill the fields with USD') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'USD', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => 123, :expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }

  it('should fill the fields with AUD') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'AUD', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => 123, :expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }

  it('should fill the fields with THB') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'THB', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => 123, :expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }
=begin
  it('should fill the fields with HKD') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'HKD', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => 123, :expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }

  it('should fill the fields with SGD') {
    post 'http://kira-35411.herokuapp.com/api/payment', {:amount => 12, :currency => 'SGD', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => 123, :expireMonth => 3, :expireYear => 2021}
    expect_status(201)
  }
=end
end
