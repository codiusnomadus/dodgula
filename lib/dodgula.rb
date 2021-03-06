require "dodgula/version"
require 'engtagger'

class Dodgula
	ADJECTIVES = %w(so such very much many).freeze

	def initialize
		@tagger = EngTagger.new
	end

	def process(str)
		# Convert input to lowercase
		str = str.downcase

		# Extract nouns, prefixing each with one of the
		# above adjectives into sentences of 2 words.
		tagger_str = @tagger.add_tags(str)
		phrases = @tagger.get_nouns(tagger_str).keys
		phrases = phrases.each_with_index.map do |phrase, i|
			"#{adjective(i)} #{phrase}."
		end

		# End every input with "wow".
		phrases << 'wow.'

		# Return a string, separating each sentence
		# with a space
		phrases.join(' ')
	end

	private

	def adjective(i)
		ADJECTIVES[i % ADJECTIVES.size]
	end
end
