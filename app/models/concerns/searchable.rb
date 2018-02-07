# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def searchable_fields(*fields)
      @searchable_fields = fields
    end

    def search(search_query)
      return all if search_query.blank?
      @tokens = search_query.split(" ")
      @built_query = []
      perform_search
    end

    def perform_search
      return all if @tokens.empty?
      build_query
      join_tables.where(@built_query.reduce { |a, e| e ? e.or(a) : a })
    end

    def build_query
      @tokens.each do |token|
        @searchable_fields.each do |field|
          build_token_query(field, token)
        end
      end
    end

    def join_tables
      if @searchable_fields.last.is_a? Hash
        joins(@searchable_fields.last.keys)
      else
        self
      end
    end

    def build_token_query(field, token)
      if field.is_a? Hash
        field.each_pair do |table, table_fields|
          table_fields.each do |table_field|
            build_sql(table_field, token, table.to_s.classify.constantize)
          end
        end
      else
        build_sql(field, token)
      end
    end

    def build_sql(field, token, class_name = self)
      @built_query << if class_name.column_for_attribute(field.to_s).type == :integer
                        class_name.arel_table[field].matches(token)
                      else
                        class_name.arel_table[field].matches("%#{token}%")
                      end
    end
  end
end
