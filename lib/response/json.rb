class Response
  # JSON response
  class JSON < self
    HEADERS = IceNine.deep_freeze('Content-Type' => 'application/json; charset=UTF-8')

    # Build JSON response with defaults
    #
    # @param [Object] body
    #   rack compatible body
    #
    # @return [Response::JSON]
    #
    # @example
    #
    #   # With defaults
    #   response = Response::JSON.build('{"foo":"bar"}')
    #   response.status  # => Response::Status::OK
    #   response.headers # => { 'Content-Type' => 'application/json; charset=UTF-8' }
    #   response.body    # => "{\"foo\":\"bar\"}"
    #
    #   # With overriding defaults
    #   response = Response::JSON.build("<foo><bar>Hello</bar></foo>") do |response|
    #     response.with_status(Response::Status::NOT_FOUND)
    #   end
    #
    #   response.status  # => Response::Status::NOT_FOUND
    #   response.headers # => { 'Content-Type' => 'application/json; charset=UTF-8' }
    #   response.body    # => "{\"foo\":\"bar\"}"
    #
    # @api public
    #
    def self.build(body)
      super(Status::OK, HEADERS, body)
    end
  end
end
