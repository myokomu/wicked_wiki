#Wicked Wiki#

Wicked Wiki is wicked Rails 4 wiki engine. The gem is still in development, but you can certainly play with it now!

##Quick Start##
In your work directory:

```shell
git clone https://github.com/myokomu/wicked_wiki.git
```

Wicked Wiki works with Devise out of the box. If you don't use other authentication solutions, you can you can set up the configurations after the engine is installed.

Wicked Wiki currently uses [elasticsearch](http://www.elasticsearch.org) with [tire/retire](https://github.com/karmi/retire) for searching. You can find the instructions for installing elasticsearch server [here](https://github.com/karmi/retire).  

In your Gemfile:

```ruby
gem "devise" ##if you are not using any authentication solutions.
gem "paperclip"
gem "bootstrap-sass"
gem "wicked_wiki", path: File.expand_path("../../wicked_wiki", __FILE__)
```

Now bundle install:

```shell
bundle install
```

Devise quick installation:

```shell
rails g devise:install
rails g devise User
rake db:migrate
```

Now let's install Wicked Wiki!
```shell
rails g wicked_wiki:install
```

Done! Boot up rails server and visit localhost:3000/wikis.
You can find all configurations in config/initializers/wicked_wiki.rb.


To-dos:

+ seed data
+ better dependencies
+ view generator
+ better readme
+ en.yml
+ zh-CH.yml
+ Destroy action
+ Discussion/talk
+ Topic Banning
+ Admin content management
+ friendlyid for diff