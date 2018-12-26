class Word < ApplicationRecord
  include PgSearch
  pg_search_scope :kinda_spelled_like,
                  :against => :spelling,
                  :using => :trigram
end
