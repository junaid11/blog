class SuggestionsController < ApplicationController
  def index
    @suggestions = current_user.suggestions
  end
end
