# frozen_string_literal: true

module Alchemy
  class Keyword < Base
    def process_text(text)
      keywords = keywords("text", text)
      keywords = sort(keywords.fetch("keywords", []))

      keywords.map do |keyword|
        {
          text: keyword["text"],
          relevance: keyword["relevance"]
        }
      end
    end
  end
end
