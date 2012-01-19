# AwesomeEngine

AwesomeEngine™ turbocharges your `Rails::Engine` like you've never seen before.
With AwesomeEngine™ you can add `Activesupport::Concern`s LIKE A BOSS.

## How to use?

1. Include `AwesomeEngine::Extendable` in your `Rails::Engine`
3. Create `SomeAwesomeExtension` that includes all your extension concerns
2. Extend the app via `SomeAwesomeExtension` by calling `SomeAwesomeExtension.concern!`

## Show me the Code!

First of all, lets create `SomeAwesomeExtension`

    # lib/noobengine/extensions/some_awesome_extension.rb
    class SomeAwesomeExtension < AwesomeEngine::Extension

      module PostConcern
        included do
          has_many :comments
        end

        module ClassMethods
          def comments_by_rating
            comments.order("rating DESC")
          end
        end
      end

      module UserConcern
        included do
          has_many :comments, :through => :posts
        end
      end

    end

Then, make your `Rails::Engine` extendable.

    #lib/noobengine/engine.rb
    module Noobengine
      class Engine < Rails::Engine
        include AwesomeEngine::Extendable
      end

      config.to_prepare do
        ::SomeAwesomeExtension.concern!
      end
    end


## How it works?

Not available yet.

## TODO

* How it works
* Make it testable (I dont want to make it dependent on rails gem, just railtie)