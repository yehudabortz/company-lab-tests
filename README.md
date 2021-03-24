# Company Lab Tests

Company Lab Tests is a management and fulfillment web application for Companies and Labs to collaborate on test results and efficiently update and display results to their customers. Companies can have many labs performing tests and Labs can have many Companies serving them tests. 
## Installation

- Clone this repository

- Make sure you are using ruby version 2.6.6 and Rails 6.1.3

```bash
rvm use 2.6.6
```

- Bundle Install all dependencies

``` bash
bundle install
```

- Create a `.env` file in the root directory

``` bash
touch .env
```

- In the `.env` file create your environment variables for OmniAuth for Google

``` bash
GOOGLE_CLIENT_ID=USE YOUR GOOGLE CLIENT ID HERE WITHOUT QUOTES
GOOGLE_CLIENT_SECRET=YOUR GOOGLE CLIENT SECRET HERE WITHOUT QUOTES
```


- Migrate the database
``` bash
rails db:migrate 
```  
- Start the server 
``` bash
rails server
```


## Usage

- Create a Company account and create new test ids to be distributed.
- Create a Lab account.
- Connect the Lab account to the company account form the company admin dashboard.
- Accept the request in the Lab dashboard and check the tests table to see it populated with tests form the connected company

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://github.com/yehudabortz/company-lab-tests/blob/master/LICENSE)