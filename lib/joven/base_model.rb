require "joven/helpers/model_helper"

module Joven
  class BaseModel
    def self.to_table(table_name)
      @@table_name = table_name.to_s
      @@model = Object.const_get(@@table_name[0...-1].capitalize)
    end

    def self.property(field_name, options)
      @@mappings[field_name] = field_name
      @@fields[field_name] = options
      attr_accessor field_name
    end

    def self.create_table
      query = "CREATE TABLE IF NOT EXISTS #{@@table_name}"\
              "(#{fields_builder(@@fields)})"
      @@db.execute(query)
    end

    def save
      if @id
        @@db.execute("UPDATE #{@@table_name}
          SET #{update_record_placeholders}
          WHERE id = ?", update_record_values)
      else
        new_record_placholders = (["?"] * (@@mappings.size - 1)).join(",")
        @@db.execute "INSERT INTO #{@@table_name}(#{get_columns})
          VALUES(#{new_record_placholders})", new_record_values
      end
    end

    def self.all
      data = @@db.execute("SELECT * FROM #{@@table_name}")

      data.map do |row|
        map_row_to_object row
      end
    end

    def self.find(id)
      row = @@db.execute("SELECT #{@@mappings.keys.join(',')}
        FROM #{@@table_name} where id = ?", id).first
      map_row_to_object row
    end

    def destroy
      @@db.execute "DELETE FROM #{@@table_name} WHERE id = ?", @id
    end

    def self.destroy_all
      @@db.execute "DELETE FROM #{@@table_name}"
    end
  end
end
