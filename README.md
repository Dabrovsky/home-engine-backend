# README

##### Prerequisites

The main goal of this service is to function as middleware, connecting external IoT devices with a mobile application, allowing the exchange of data between them

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.2.2](https://github.com/ruby/ruby/releases/tag/v3_2_2)
- Rails [7.1.2](https://github.com/rails/rails/releases/tag/v7.1.2)

##### 1. Check out the repository

```bash
git clone git@github.com:Dabrovsky/home-engine-backend.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create
rails db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

And now you can visit the site with the URL http://localhost:3000

#### License

All code added by me (@Dabrovsky) is availabe under the MIT License.
