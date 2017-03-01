module Polymorpheus
  module SchemaDumper
    def data_sources(stream)
      super

      if @connection.respond_to?(:triggers)
        @connection.triggers.collect(&:schema_statement).each do |statement|
          stream.puts statement
        end
      end

      stream.puts
    end
  end
end
