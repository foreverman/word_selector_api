class Word < ApplicationRecord
  include PgSearch
  pg_search_scope :kinda_spelled_like,
                  against: :spelling,
                  using:  :trigram,
                  ranked_by: ":trigram"

  def self.fuzzy_search(word_input, words_excluded)
    query = self
    if words_excluded && words_excluded.any?
      query = query.where.not(spelling: words_excluded)
    end
    query.kinda_spelled_like(word_input).limit(10)
  end
end
