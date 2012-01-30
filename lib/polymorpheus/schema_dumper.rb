module Polymorpheus
  module SchemaDumper
    extend ActiveSupport::Concern

    included do
      alias_method_chain :tables, :triggers
    end

    def tables_with_triggers(stream)
      tables_without_triggers(stream)

      @connection.triggers.collect(&:schema_statement).each do |statement|
        stream.puts statement
      end
      stream.puts
    end
  end
 end

