require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word].strip.downcase.split('')
    @letters = params[:letters].split
    url = "https://wagon-dictionary.herokuapp.com/#{@word.join}"
    word_serialized = URI.open(url).read
    api_response = JSON.parse(word_serialized)
    @is_valid = api_response['found']
  end
end
