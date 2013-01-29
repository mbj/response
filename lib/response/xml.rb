class Response
  # XML response
  class XML < self
    HEADERS = IceNine.deep_freeze('Content-Type' => 'application/xml; charset=UTF-8')

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
    #   response.status  # => Response::Status::OK
    #   response.headers # => { 'Content-Type' => 'application/xml; charset=UTF-8' }
    #   response.body    # => "<foo><bar>Hello</bar></foo>"
    #
    #   # With overriding defaults
    #   response = Response::HTML.build("<foo><bar>Hello</bar></foo>") do |response|
    #     response.with_status(404)
    #   end
    #   response.status  # => Response::Status::OK
    #   response.headers # => { 'Content-Type' => 'application/xml; charset=UTF-8' }
    #   response.body    # => "<foo><bar>Hello</bar></foo>"
    #
    # @api public
    #
    def self.build(body)
      super(Status::OK, HEADERS, body)
    end
  end
end
