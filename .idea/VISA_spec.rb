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

    #db_hq = MongoClient.new("heroku_9zz9bm0g:9qtdvpu61se7usccbh2n3jd103@ds059155.mongolab.com:59155/heroku_9zz9bm0g")
    db_hq = MongoClient.new("ds059155.mongolab.com", 59155).db("heroku_9zz9bm0g")
    if (auth = db_hq.authenticate(heroku_9zz9bm0g, "9qtdvpu61se7usccbh2n3jd103"))
      coll = db_hq.collection("heroku_9zz9bm0g")
      gateway_check = coll.find(:fields => ["gateway"]).last_document
      if gateway_check == "Paypal"
        print("Correct")
      else
        print("Test failed")
      end
    else
      print("Authentication failed")
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
