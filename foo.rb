module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module MigrationCompatibility # :nodoc: all
      module V6_0
        def create_table(table_name, **options)
          p 'V6_0 modified create table at ActiveRecord::ConnectionAdapters::MigrationCompatibility'
        end
      end
      module V5_2
        def create_table(table_name, **options)
          p 'V5_2 modified create table at ActiveRecord::ConnectionAdapters::MigrationCompatibility'
        end
      end
    end
  end
end

module ActiveRecord
  module ConnectionAdapters
    module MySQL
      module MigrationCompatibility # :nodoc: all
        class V6_0
          include ActiveRecord::ConnectionAdapters::MigrationCompatibility::V6_0
          def create_table(table_name, **options)
            p 'V6_0 at mysql'
            super
          end
        end
        class V5_2 < V6_0
          include ActiveRecord::ConnectionAdapters::MigrationCompatibility::V5_2
          def create_table(table_name, **options)
            p 'V5_2 at mysql'
            super
          end
        end
      end
    end
  end
end

module ActiveRecord
  class Migration
    module Compatibility # :nodoc: all
      class V6_0
        def create_table(table_name, **options)
          p 'V60 original create table at ActiveRecord::Migration::Compatibility'
        end
      end
      class V5_2 < V6_0
        include ActiveRecord::ConnectionAdapters::MigrationCompatibility::V5_2
        def create_table(table_name, **options)
          p 'V52 original create table at ActiveRecord::Migration::Compatibility'
        end
      end
    end
  end
end
