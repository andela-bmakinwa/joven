require "sqlite3"
require "joven/helpers/database_helper"

module Joven
  class BaseModel
    extend Joven::DatabaseHelper

    DB = Joven::DatabaseHelper

    @@db = DB.connect
    @@table_name = ""
    @@model = nil
    @@mappings = {}
    @@fields = {}

    def self.fields_builder(fields)
      columns = ""
      fields.each do |field, constraints|
        columns += "#{field} #{parse_constraints(constraints)}, "
      end

      columns[0...-2]
    end

    def self.parse_constraints(constraints)
      attributes = ""
      constraints.each do |attr, value|
        attributes += send(attr.to_s, value)
      end

      attributes
    end

    def self.type(value)
      "#{value.to_s.upcase} "
    end

    def self.primary_key(value)
      return "PRIMARY KEY " if value
      " "
    end

    def self.nullable(value)
      "NOT NULL " unless value
      "NULL "
    end

    def self.default(value)
      "DEFAULT `#{value}` "
    end

    def self.auto_increment(value)
      "AUTOINCREMENT " if value
    end

    def method_missing(method, *_args)
      @model.send(method)
    end

    def update_record_placeholders
      columns = parse_columns
      columns.map { |col| "#{col}=?" }.join(",")
    end

    def get_columns
      columns = parse_columns
      columns.join(",")
    end

    def parse_columns
      columns = @@mappings.keys
      columns.delete(:id)

      columns
    end

    def get_values
      attributes = @@mappings.values
      attributes.delete(:id)
      attributes.map { |method| send(method) }
    end

    def update_record_values
      get_values << send(:id)
    end

    def new_record_values
      get_values
    end

    def self.map_row_to_object(row)
      model = @@model.new

      @@mappings.each_value.with_index do |attribute, index|
        model.send("#{attribute}=", row[index])
      end

      model
    end
  end
end
