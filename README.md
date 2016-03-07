# HQ_auto
There is a ruby project created in RubyMine.<br>
All gems for work described in Gemfile.<br>
Before launching the project you need to install Bundler tools and run 'bundle install' for describing gems.

# Solution problems
There are some problems I couldn't resolve.<br>
1. Only VISA card works in tests. For others card API falls and returns 500 in response (although you can make the payments in web by hand). I can't imagine why this happen.<br>
2. THB, HKD, SGD currencies don't work at all. I can't make the payments with it (check Defects).<br>
4. This phrase db_hq.collection_names returns something strange in name {"listCollections"=>1, "cursor"=>{}, "filter"=>{:name=>{"$not"=>/system.|\$/}}}.<br>
So that's why I can't get right collection from DB using wrong collection name.

# Defects
1. For API http://kira-35411.herokuapp.com/api/payment with parametrs like \"amount\":\"2\",\"currency\":\"USD\",\"fullName\":\"qwe rty\",\"firstName\":\"qwe\",\"lastName\":\"rty\",\"cardNumber\":\"5110927212387377\",\"cardCVV\":\"123\",\"expireMonth\":\"3\",\"expireYear\":\"2021\"
Postman returns "message": "Amount is required.\nCannot determine payment method."
2. The same defect appears with HKD, SGD currencies for Visa card.
3. The same defect appears for MasterCard and Amex for all currencies.
