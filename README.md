# NBP month stats
Look for the lowest price of a particular currency in particular month
## Usage
### Local
1. Install ruby
2. `gem install bundler`
3. `bundle install`
4. `ruby main.rb currency month year` e.g. `ruby main.rb USD 4 22` - all params are optional and defualt to USD and current month

### Dockerised
1. `docker-compose up -d`
2. `docker-compose exec web ruby main.rb currency month year` e.g. `ruby main.rb USD 4 22` - all params are optional and defualt to USD and current month