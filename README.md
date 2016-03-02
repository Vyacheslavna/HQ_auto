# HQ_auto
There is a ruby project created in RubyMine.<br>
All gems for work described in Gemfile.<br>
Before launching the project you need to install Bundler tools and run 'bundle install' for describing gems.

# Solution problems
There are some problems I couldn't resolve.<br>
1. Only VISA card works in tests. For others card API falls and returns 500 in response (although you can make the payments in web by hand). I can't imagine why this happen.<br>
2. THB, HKD, SGD currencies don't work at all. I can't make the payments with it.<br>
3. Can't find how to get only 1 field from db for checking the gateway.
