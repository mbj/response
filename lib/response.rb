# encoding: utf-8

require 'time'
require 'ice_nine'
require 'adamantium'
require 'concord'
require 'abstract_type'
require 'equalizer'

# Library to build rack compatible responses in a functional style
class Response
  include Adamantium::Flat, Concord.new(:status, :headers, :body)

  # Error raised when finalizing responses with undefined components
  class InvalidError < RuntimeError; end

  TEXT_PLAIN = 'text/plain; charset=UTF-8'.freeze

  # Undefined response component
  #
  # A class to get nice #inspect behavior ootb
  #
  Undefined = Class.new.freeze

  # Return status code
  #
  # @return [Response::Status]
  #   if set
  #
  # @return [undefined]
  #   otherwise
  #
  # @api private
  #
  attr_reader :status

  # Return headers code
  #
  # @return [Hash]
  #   if set
  #
  # @return [undefined]
  #   otherwise
  #
  # @api private
  #
  attr_reader :headers

  # Return status code
  #
  # @return [#each]
  #   if set
  #
  # @return [undefined]
  #   otherwise
  #
  # @api private
  #
  attr_reader :body

  # Return response with new status
  #
  # @param [Fixnum] status
  #   the status for the response
  #
  # @return [Response]
  #   new response object with status set
  #
  # @example
  #
  #   response = Response.new
  #   response = response.with_status(200)
  #   response.status # => 200
  #
  # @api public
  #
  def with_status(status)
    self.class.new(status, headers, body)
  end

  # Return response with new body
  #
  # @param [Object] body
  #   the body for the response
  #
  # @return [Response]
  #   new response with body set
  #
  # @example
  #
  #   response = Response.new
  #   response = response.with_body('Hello')
  #   response.body # => 'Hello'
  #
  # @api public
  #
  def with_body(body)
    self.class.new(status, headers, body)
  end

  # Return response with new headers
  #
  # @param [Hash] headers
  #   the header for the response
  #
  # @return [Response]
  #   new response with headers set
  #
  # @example
  #
  #   response = Response.new
  #   response = response.with_headers({'Foo' => 'Bar'})
  #   response.headers # => {'Foo' => 'Bar'}
  #
  # @api public
  #
  def with_headers(headers)
    self.class.new(status, headers, body)
  end

  # Return response with merged headers
  #
  # @param [Hash] headers
  #   the headers to merge
  #
  # @example
  #
  #   response = Response.new(200, {'Foo' => 'Baz', 'John' => 'Doe'})
  #   response = response.merge_headers({'Foo' => 'Bar'})
  #   response.headers # => {'Foo' => 'Bar', 'John' => 'Doe'}
  #
  # @api public
  #
  # @return [Response]
  #   returns new response with merged header
  #
  def merge_headers(headers)
    self.class.new(status, self.headers.merge(headers), body)
  end

  # Return rack compatible array after asserting response is valid
  #
  # @return [Array(Fixnum, Enumerable(Hash{String => String}), Enumerable<String>)]
  #   a rack compatible array
  #
  # @raise InvalidError
  #   raises InvalidError when request containts undefined components
  #
  # @api private
  #
  def to_rack_response
    assert_valid
    rack_array
  end

  # Test if object is a valid response
  #
  # @return [true]
  #   if all required fields are present
  #
  # @return [false]
  #   otherwise
  #
  # @api private
  #
  def valid?
    ![status, headers, body].any? { |item| item.equal?(Undefined) }
  end
  memoize :valid?

  # Return rack compatible array
  #
  # @return [Array(Fixnum, Enumerable(Hash{String => String}), Enumerable<String>)]
  #   rack compatible array
  #
  # @example
  #
  #   response = Response.new(200, {'Foo' => 'Bar'}, 'Hello World')
  #   response.rack_array # => [200, {'Foo' => 'Bar'}, 'Hello World']
  #
  # @api public
  #
  def rack_array
    [status.code, headers, body]
  end
  memoize :rack_array

  # Return contents of content type header
  #
  # @return [String]
  #
  # @api private
  #
  def content_type
    headers['Content-Type']
  end

  # Return last modified
  #
  # @raise [ArgumentError]
  #   if content of Last-Modified header is not a RFC 2616 compliant date
  #
  # @return [String]
  #   if last modified header is present, a string which represents the time
  #   as rfc1123-date of HTTP-date defined by RFC 2616
  #
  # @return [nil]
  #   otherwise
  #
  # @api private
  #
  def last_modified
    value = headers.fetch('Last-Modified') { return }
    Time.httpdate(value)
  end
  memoize :last_modified

  # Return contents of cache control header
  #
  # @return [String]
  #
  # @api private
  #
  def cache_control
    headers['Cache-Control']
  end

  # Build response with a dsl like interface
  #
  # @example
  #
  #   response = Response.build(200) do |response|
  #     response.
  #       with_headers('Foo' => 'Bar').
  #       with_body('Hello')
  #   end
  #
  #   response.status  # => 200
  #   response.headers # => {'Foo' => 'Bar' }
  #   response.body    # => 'Hello'
  #
  # @return [Response]
  #
  # @api public
  #
  def self.build(status = Undefined, headers = {}, body = Undefined)
    response = new(status, headers, body)
    response = yield response if block_given?
    response
  end

private

  # Raise error when request contains undefined components
  #
  # @raise InvalidError
  #   raises InvalidError when request contains undefined components
  #
  # @return [undefined]
  #
  # @api private
  #
  def assert_valid
    raise InvalidError, "Not a valid response: #{inspect}" unless valid?
  end
end

require 'response/status'
require 'response/redirect'
require 'response/html'
require 'response/xml'
require 'response/json'
require 'response/text'
