# frozen_string_literal: true

module Alchemy
  class Entity < Base
    def process_text(text)
      entities = entities("text", text)
      entities = sort(entities.fetch("entities", []))

      entities.map do |entity|
        {
          text: entity["text"],
          relevance: entity["relevance"],
          type: entity["type"],
        }
      end
    end
  end
end
