class Response
  # HTML response
  class HTML < self
    HEADERS = IceNine.deep_freeze('Content-Type' => 'text/html; charset=UTF-8')

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
    #   response.status  # => Response::Status::OK
    #   response.headers # => { 'Content-Type' => 'text/html; charset=UTF-8' }
    #   response.body    # => "<html><body>Hello</body></html>"
    #
    #   # With overriding defaults
    #   response = Response::HTML.build("<html><body>Hello</body></html>") do |response|
    #     response.with_status(Respnse::Status::NOT_FOUND)
    #   end
    #   response.status  # => Response::Status::NOT_FOUND
    #   response.headers # => { 'Content-Type' => 'text/html; charset=UTF-8' }
    #   response.body    # => "<html><body>Hello</body></html>"
    #
    # @api public
    #
    def self.build(body)
      super(Status::OK, HEADERS, body)
    end
  end
end
