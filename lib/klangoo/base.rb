module Klangoo
  class Base
    include HTTParty

    base_uri "http://magnetapi.klangoo.com/Service.svc"

    def post(url, body)
      body.merge!(
        "calk" => ENV["KLANGOO_CALK"],
        "format" => "json"
      )

      response =  self.class.post(url, body: body)

      if response.code.to_i == 200 && response["status"] == "OK"
        response
      else
        raise StandardError.new(response.body)
      end
    end
  end
end
