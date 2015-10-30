# Rails `for_select`

[![Build Status](https://travis-ci.org/ekampp/rails-for_select.svg?branch=master)](https://travis-ci.org/ekampp/rails-for_select)

Simplifies delivering content to a rails form `select_tag` by exposing the `for_select` class-method on any class 
inheriting from ActiveRecord::Base. 

```ruby
User.for_select 
# => [["name", 1], ["other name", 2], ...]
```

For those models that doesn't defaultly have a name, or that should use another id field, you can customize it like this.

```ruby
User.for_select(id: :uuid) 
# => [["name", 'uuid1'], ["other name", 'uuid2'], ...]

User.for_select(name: :full_name) 
# => [["full name", 1], ["other full name", 2], ...]
```

If you're records doesn't have timestamps you can use another cache key.

```ruby
User.for_select(cache_key: :created_on) 
# => [["name", 1], ["other name", 2], ...]
```

Putting it all together with a rails form

```slim
= form_for Post do |f|
  = f.select :author, User.for_select
```
