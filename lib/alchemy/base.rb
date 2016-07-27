# frozen_string_literal: true

require "alchemy_api"

module Alchemy
  class Base < AlchemyAPI
    def process_text(_text)
      raise StandardError, "Needs implementation"
    end

    private

    def sort(values)
      values.sort{ |a, b| b["relevance"].to_f <=> a["relevance"].to_f }
    end
  end
end
