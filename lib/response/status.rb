class Response
  # HTTP response status code with text
  class Status
    include Adamantium, Composition.new(:code, :text)

    private_class_method :new

    OK                = new(200, 'OK'               )
    NOT_FOUND         = new(404, 'Not Found'        )
    NOT_MODIFIED      = new(304, 'Not Modified'     )
    FOUND             = new(302, 'Found'            )
    MOVED_PERMANENTLY = new(301, 'Moved Permanently')

  end
end
