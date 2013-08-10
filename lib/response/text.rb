class Response
  # TEXT response
  class Text < self
    HEADERS = IceNine.deep_freeze('Content-Type' => 'text/plain; charset=UTF-8')

    # Build text response with defaults
    #
    # @param [Object] body
    #   rack compatible body
    #
    # @return [Response::Text]
    #
    # @example
    #
    #   # With defaults
    #   response = Response::Text.build('foo')
    #   response.status  # => Response::Status::OK
    #   response.headers # => { 'Content-Type' => 'text/plain; charset=UTF-8' }
    #   response.body    # => "foo"
    #
    #   # With overriding defaults
    #   response = Response::Text.build('foo') do |response|
    #     response.with_status(Respnse::Status::NOT_FOUND)
    #   end
    #
    #   response.status  # => Response::Status::NOT_FOUND
    #   response.headers # => { 'Content-Type' => 'text/plain; charset=UTF-8' }
    #   response.body    # => "foo"
    #
    # @api public
    #
    def self.build(body)
      super(Status::OK, HEADERS, body)
    end
  end
end
