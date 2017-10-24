# guaranteed

> Give me something for nothing!

## What is this?

Guaranteed is a tiny library that ensures you always have an object to act upon. By eliminating continual checks for your objects' capabilities you can focus on your code's functionality.

Guaranteed's primary goal is to __eliminate nil checks__.

## Hmmm... I'm not sure I need this

Hey, I'm with you here, you probably don't. Consider this a "nice to have" library. But the truth is that using the library can lead to much cleaner designs. Plus, it's almost zero overhead for your project. All you need is Ruby.

Here's the basic usage. Let's fire up `irb` and illustrate a frequent problem we face when coding.

```ruby
# The most explicit approach
# Too verbose!
def username
  user.nil? ? nil : user.name
end

# An improvement (arguably)
# What if the name attribute should return a boolean?
def username
  user && user.name
end

# Rails developers think this is a neat trick :(
def username
  user.try(:name)
end

# Guaranteed to the rescue!
def username
  Guaranteed.Object(user).name
end
```

## I'm still not convinced

The above example is just scratching the surface of Guaranteed's abilities. Let's take a look at some more interesting examples.

Most common Ruby methods on objects are supported. They follow Ruby's implicit type conversions for an instance of [NilClass](https://ruby-doc.org/core-2.3.0/NilClass.html).

```ruby
object = Guaranteed.Object(nil)

object.nil?     # => true
!object         # => true
object.to_a     # => []
object.to_h     # => {}
object.to_s     # => ''
object.to_f     # => 0.0
object.to_i     # => 0
object.empty?   # => true
```

Need method chaining? You're covered.

```ruby
object = Guaranteed.Object(nil)

object.this.will.definitely.not.work!
# => Returns self
```

Agreed, this amount of method chaining breaks the [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter). Sometimes reality hits you hard in the face though. Let's try the above example using [ActiveSupport::Object](http://api.rubyonrails.org/classes/Object.html).

```ruby
# Ugh..
object.try(:this).try(:will).try(:definitely).try(:not).try(:work!)
# => nil
```

Bonus Ruby idiom that's supported.

```ruby
object = Guaranteed.Object(nil)

object.tap do |o|
  o.name = 'Homer Simpson'
  o.save!
end
# => Returns self
```

Using Rails? I've got good news for you! The library supports some Rails-specific methods too.

```ruby
object = Guaranteed.Object(nil)

object.present?     # => false
object.as_json      # => nil
object.to_json      # => "null"
object.persisted?   # => false
```

## OK, I'm sold. How do I install it?

```
$ gem install guaranteed
# or add it to your Gemfile
```

## Can I contribute?

Yes, please. Feel free to fork the project and create your own branches. Consider creating a pull request back to this repo.

Remember, you can run the tests with

```
$ rake
```
