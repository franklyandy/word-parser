#!/usr/bin/env ruby
class WordParser
  def initialize(text)
    @text = text
  end

  def get_mirror_view
    @text.reverse
  end

  def get_words_and_occurences(keep_case = false)
    wc = Hash.new(0)
    # @text.scan(/\w+['|:]{1}\w+|\w+\-+\w+|\w+/) { |w|
    @text.scan(/\w+['|:|\-]{1}\w+|[\w.\.]{2,}|\w+/) { |w|
      w = keep_case ? w : w.downcase
      wc[w] += 1
    }
    wc
  end
end

sample = IO.read 'context.txt'
wp = WordParser.new sample
wp.get_words_and_occurences.sort_by { |k, v| v }.reverse.each { |k, v| puts "#{k}:#{v}"}
