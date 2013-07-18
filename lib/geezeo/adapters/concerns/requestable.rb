module Geezeo
  module Adapters
    module Requestable
      def request(method, path, options = {})
        params = {}
        params[:path] = path
        params[:options] = options
        params[:method] = method
  
        response = HTTParty.send(method, path,
          basic_auth: {username: credentials.api_key, password: ""},
          query: options[:query],
          body: options[:body],
          format: :json,
          headers: {
            "Accept" => "application/json",
            "Content-Type" => "application/json; charset=utf-8",
            "User-Agent" => "Geezeous/#{Geezeo::VERSION}",
          }.update(options[:headers] || {})
        )
          
        params[:response] = response.inspect.to_s
  
        case response.code
        when 200..201
          response         
        when 404
          raise Geezeo::NotFound.new(response, params)
        end
      end
    end
  end
end
