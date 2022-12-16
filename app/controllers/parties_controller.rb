class PartiesController < ApplicationController
  VOWELS = %w(A E I O U Y)

  def new
    @ten_list_letters = Array.new(5) { VOWELS.sample }
    @ten_list_letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @ten_list_letters.shuffle!
  end

  def score
    @ten_list_letters = params[:letters].split
    @word = (params[:word] || "").upcase
    @available = available?(@word, @ten_list_letters)
  end

  private

  def available?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
