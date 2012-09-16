class Response
  # HTML response
  class HTML < self
    HEADER = IceNine.deep_freeze('Content-Type' => 'text/html; charset=UTF-8')

    # Build html response with defaults
    #
    # @param [Object] body
    #   rack compatible body
    #
    # @return [Array]
    #   rack compatible response array
    #
    # @example
    #   
    #   # With defaults
    #   response = Response::HTML.build("<html><body>Hello</body></html>")
    #   response[0] # => 200
    #   response[1] # => { 'Content-Type' => 'text/html; charset=UTF-8' }
    #   response[2] # => "<html><body>Hello</body></html>"
    #
    #   # With overriding defaults
    #   response = Response::HTML.build("<html><body>Hello</body></html>") do |response|
    #     response.with_status(404)
    #   end
    #   response[0] # => 404
    #   response[1] # => { 'Content-Type' => 'text/html; charset=UTF-8' }
    #   response[2] # => "<html><body>Hello</body></html>"
    #
    # @api public
    #
    def self.build(body, &block)
      super(200, HEADER, body, &block)
    end
  end
end
