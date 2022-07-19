# frozen_string_literal: true

class ArticlesFetcher < BaseService
  def initialize(tags_ids)
    @tags_ids = tags_ids
  end

  def call
    return Article.all if tags_ids.blank?

    Article.joins(:tags)
           .where(tags: { id: tags_ids })
           .group(:id)
           .having(Article.arel_table[:id].count.gteq(tags_ids.length))
  end

  private

  attr_reader :tags_ids
end
