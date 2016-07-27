# frozen_string_literal: true
class TagsProcessor
  def initialize(resource)
    @resource = resource
    @text = resource.text
  end

  def run
    tags = NlpProcessor.new(text).run
    tags = normalize_tags(tags)

    if tags.any?
      process_tags(tags)
    end
  end

  private

  attr_reader :resource, :text

  def process_tags(tags)
    tags.each do |tag|
      new_tag = resource.tags.find_or_create_by(name: tag[:text])
      new_tag.kind = tag[:type] if tag[:type].present?
      new_tag.relevance = tag[:relevance].to_f

      new_tag.save
    end
  end

  def normalize_tags(tags)
    tags.map do |tag|
      tag[:text] = tag[:text].
        gsub(/,|\?|-|_|\(|\)|\*|{|}|~|!/, "").
        strip.
        downcase

      tag
    end
  end
end
