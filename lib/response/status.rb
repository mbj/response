module Response
  # HTTP response status code with text
  class Status
    include Adamantium, Composition.new(:code, :text)

    REGISTRY = {}

    # Instantiate object
    #
    # @return [Code]
    #
    # @api private
    #
    def self.new(*args)
      instance = super
      REGISTRY[instance.code]=instance
      instance
    end

    private_class_method :new

    new(200, 'OK')
    new(404, 'Not Found')
    new(304, 'Not Modified')

    REGISTRY.freeze

  end
end
