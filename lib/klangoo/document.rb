module Klangoo
  class Document < Base
    @@rank_relevance = {  'VR' => '0.85',
                          'R' => '0.60',
                          'SR' => '0.45',
                          'NR' => '0.26' }

    def process_text(text)
      response = post("/ProcessDocument", "text" => text)

      get_entities(response["document"])
    end

    private

    def get_entities(document)
      document["entities"].map do |entity|
        relevance = @@rank_relevance[entity["rank"]]

        {
          text: entity["token"],
          relevance: relevance,
          type: entity["type"]
        }
      end
    end
  end
end
