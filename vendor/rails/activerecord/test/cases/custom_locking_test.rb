require "cases/helper"
require 'models/person'

module ActiveRecord
  class CustomLockingTest < ActiveRecord::TestCase
    fixtures :people

    def test_custom_lock
      if current_adapter?(:MysqlAdapter, :Mysql2Adapter)
        assert_match 'SHARE MODE', Person.lock('LOCK IN SHARE MODE').to_sql
        assert_sql(/LOCK IN SHARE MODE/) do
          Person.find(1, :lock => 'LOCK IN SHARE MODE')
        end
      end
    end
  end
end
