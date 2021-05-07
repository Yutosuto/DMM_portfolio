class SearchController < ApplicationController
  def search
    @model = paramd[:model]
  end
end
