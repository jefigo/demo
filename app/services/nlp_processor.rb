# frozen_string_literal: true
require "klangoo/document"

class NlpProcessor
  def initialize(text)
    @tags = []
    @text = text
  end

  def run
    get_klangoo_tags
    get_alchemy_tags

    tags
  end

  attr_accessor :text, :tags

  private

  def get_klangoo_tags
    entities = Klangoo::Document.new.process_text(text)
    tags.concat entities
  rescue Exception => exception
    Rails.logger.error "Error processing in Klangoo \
    :: Error #{exception.message}"
  end

  def get_alchemy_tags
    entities = Alchemy::Entity.new.process_text(text)
    key_words = Alchemy::Keyword.new.process_text(text)

    tags.concat entities + key_words
  rescue Exception => exception
    Rails.logger.error "Error processing in Alchemy \
    :: Error #{exception.message}"
  end
end
