class WordsController < ApplicationController
  def fuzzy_search
    query = Word
    words_excluded = params[:words_excluded]
    if words_excluded && words_excluded.any?
      query = query.where.not(spelling: params[:words_excluded])
    end
    words_recommended = query.kinda_spelled_like(params[:word_input]).limit(10)
    render json: words_recommended.map(&:spelling)
  end
end
