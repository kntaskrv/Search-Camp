# frozen_string_literal: true

class BaseServiceApplication
  extend Dry::Initializer

  option :errors, default: -> { Errors.new }

  attr_accessor :result

  class << self
    def call(*args, &block)
      new(*args).call(&block)
    end

    def new(*args)
      args << args.pop.symbolize_keys if args.last.is_a?(Hash)
      super(*args)
    end
  end

  def valid?
    errors.messages.empty?
  end
end
