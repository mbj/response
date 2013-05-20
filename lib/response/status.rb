class Response
  # HTTP response status code with text
  class Status
    include Adamantium, Concord.new(:code, :text)

    private_class_method :new

    OK                    = new(200, 'OK'                   )
    CREATED               = new(201, 'Created'              )
    NOT_FOUND             = new(404, 'Not Found'            )
    NOT_MODIFIED          = new(304, 'Not Modified'         )
    FOUND                 = new(302, 'Found'                )
    MOVED_PERMANENTLY     = new(301, 'Moved Permanently'    )
    BAD_REQUEST           = new(400, 'Bad Request'          )
    NOT_AUTHORIZED        = new(401, 'Not Authorized'       )
    FORBIDDEN             = new(403, 'Forbidden'            )
    INTERNAL_SERVER_ERROR = new(500, 'Internal Server Error')

    # Return status code
    #
    # @return [Fixnum]
    #
    # @api private
    #
    attr_reader :code

  end # Status
end # Response
