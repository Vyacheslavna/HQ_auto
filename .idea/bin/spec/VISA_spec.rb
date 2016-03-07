require 'rspec'
require 'rails_helper'
require 'airborne'
require 'mongo'

include Mongo

Airborne.configure do |config|
  config.base_url = 'http://kira-35411.herokuapp.com/api'
end

describe 'VISA' do
  before (:all) {
    @client_hq = Mongo::Client.new(['ds059155.mongolab.com:59155'], :database => 'heroku_9zz9bm0g', :user => 'heroku_9zz9bm0g', :password => '9qtdvpu61se7usccbh2n3jd103')
    db_hq = @client_hq.database()
    #db_hq.collection_names
    #returns D, [2016-03-07T21:29:04.020019 #8220] DEBUG -- : MONGODB | ds059155.mongolab.com:59155 | heroku_9zz9bm0g.listCollections | STARTED | {"listCollections"=>1, "cursor"=>{}, "filter"=>{:name=>{"$not"=>/system.|\$/}}}
    #@coll_hq = db_hq.collection("system.")
  }
  after (:all) {
    @client_hq.close
  }

  it('should fill the fields with EUR') {
    post '/payment', {:amount => '12', :currency => 'EUR', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)

    #expect(@coll_hq).to_not be_nil
    #expect(@coll_hq).not_to be_empty
  }

  it('should fill the fields with USD') {
    post '/payment', {:amount => '12', :currency => 'USD', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }

  it('should fill the fields with AUD') {
    post '/payment', {:amount => '12', :currency => 'AUD', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }

  it('should fill the fields with THB') {
    post '/payment', {:amount => '12', :currency => 'THB', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }

  it('should fill the fields with HKD') {
    post '/payment', {:amount => '12', :currency => 'HKD', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => '123', :expireMonth => '3', :expireYear => 2021}
    expect_status(201)
  }

  it('should fill the fields with SGD') {
    post '/payment', {:amount => '12', :currency => 'SGD', :fullName => 'John Smith', :firstName => 'John', :lastName => 'Smith', :cardNumber => '4032039575052396', :cardCVV => '123', :expireMonth => '3', :expireYear => '2021'}
    expect_status(201)
  }
end
