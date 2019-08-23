require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    column = DBConnection.execute2(<<-SQL)
  SELECT
    *
  FROM
    "#{self.table_name}"
  SQL
  column.first.map { |ele| ele.to_sym }
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do
        self.instance_variable_get("@#{col}")
      end
      define_method("#{col}=") do |val|
        self.instance_variable_set("@#{col}", val)
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name = "#{self}s".downcase
  end

  def self.all
    # data = DBConnection.reset (<<-SQL)
    # SELECT
    #   *
    # FROM
    #   cats;
    
    # SQL
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
