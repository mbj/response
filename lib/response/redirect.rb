class Response
  # Abstract redirect response
  class Redirect < self
    include AbstractType

    # Build redirect response
    #
    # @param [String] location
    #   the location to redirect to 
    #
    # @return [Array]
    #   rack compatible array
    #
    # @example 
    #
    #   # 302 response
    #   response = Response::Redirect::Found.build('http://example.com')
    #   response[0] # => 302
    #   response[1] # => { "Location" => "http://example.com", "Content-Type" => "text/plain" }
    #   response[2] # => "You are beeing redirected to: http://example.com"
    #   
    #   # 301 response
    #   response = Response::Redirect::Permanent.build('http://example.com')
    #   response[0] # => 301
    #   response[1] # => { "Location" => "http://example.com", "Content-Type" => "text/plain" }
    #   response[2] # => "You are beeing redirected to: http://example.com"
    #
    #   # Overriding defaults
    #
    #   response = Response::Redirect::Found.build('http://example.com') do |response|
    #     response.with_body("Redirection")
    #   end
    #
    #   response[2] # => "Redirection"
    #
    # @api public
    #   
    def self.build(location)
      super(self::STATUS, {'Location' => location, 'Content-Type' => 'text/plain'}, "You are beeing redirected to: #{location}")
    end

    # Response with default status code of 302
    class Found < self
      STATUS = 302
    end

    # Response with default status code of 301
    class Permanent < self
      STATUS = 301
    end
  end
end
