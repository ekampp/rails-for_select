require 'active_record'

module ForSelect
  module ClassMethods
      # Allow to call #for_select on each class inheriting from ActiveRecord::Base. Will generate a tuples array for use
      # in Rails' form's select fields. It will cache the resulting tuples array.
      #
      #   GameSystem.for_select # => [["name", 1], ["other name", 2], ...]
      #
      # For those models that doesn't defaultly have a name, or that should use another id field, you can customize it
      # like this.
      #
      #   GameSystem.for_select(id: :uuid) # => [["name", 'uuid1'], ["other name", 'uuid2'], ...]
      #   GameSystem.for_select(name: :full_name) # => [["full name", 1], ["other full name", 2], ...]
      #
      # If you're records doesn't have timestamps you can use another cache key.
      #
      #   GameSystem.for_select(cache_key: :created_on) # => [["name", 1], ["other name", 2], ...]
      def for_select(id: :id, name: :name, cache_key: :updated_at)
        Rails.cache.fetch [self.to_s.tableize, :select, self.maximum(cache_key)] do
          find_each.collect do |record|
            [
              record.send(name),
              record.send(id),
            ]
          end
        end
      end
  end
end

ActiveRecord::Base.extend(ForSelect::ClassMethods)
