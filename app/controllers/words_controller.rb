class WordsController < ApplicationController
  def fuzzy_search
    words_recommended = Word.fuzzy_search(
      params[:word_input], 
      params[:words_excluded]
    )
    render json: words_recommended.map(&:spelling)
  end
end
