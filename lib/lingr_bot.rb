require "lingr_bot/version"

require 'open-uri'
require 'digest/sha1'
require 'hashie'
require 'json'
require 'active_support'
require 'active_support/core_ext'

class LingrBot
  cattr_accessor :config
  attr_accessor :config

  class Configure < HashWithIndifferentAccess
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::SymbolizeKeys
  end

  self.config = Configure.new(id: ENV['LINGR_BOT_ID'], secret: ENV['LINGR_BOT_SECRET'])

  def initialize(options = {})
    self.config = self.class.config.merge options
  end

  module BotMethods
    def configure
      yield config if block_given?
    end

    def verifier
      Digest::SHA1.hexdigest config.id + config.secret
    end

    def say(room_id, message)
      message_encoded = URI.encode message
      url = "http://lingr.com/api/room/say?room=#{room_id}&bot=#{config.id}&text=#{message_encoded}&bot_verifier=#{verifier}"
      response_body = open(url).read
      JSON.parse response_body
    end
  end

  include BotMethods
  extend  BotMethods
end
