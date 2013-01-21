class Response
  # XML response
  class XML < self
    HEADER = IceNine.deep_freeze('Content-Type' => 'application/xml; charset=UTF-8')

    # Build xml response with defaults
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
    #   response = Response::XML.build("<foo><bar>Hello</bar></foo>")
    #   response[0] # => 200
    #   response[1] # => { 'Content-Type' => 'application/xml; charset=UTF-8' }
    #   response[2] # => "<foo><bar>Hello</bar></foo>"
    #
    #   # With overriding defaults
    #   response = Response::HTML.build("<foo><bar>Hello</bar></foo>") do |response|
    #     response.with_status(404)
    #   end
    #   response[0] # => 404
    #   response[1] # => { 'Content-Type' => 'application/xml; charset=UTF-8' }
    #   response[2] # => "<foo><bar>Hello</bar></foo>"
    #
    # @api public
    #
    def self.build(body)
      super(200, HEADER, body)
    end
  end
end
