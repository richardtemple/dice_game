class HandScore

	def initialize
		@total_hand_score = 0
	end

	def score_sets(sets:)
		sets.each do |set|
			send("score_#{set[0].to_s}", set: set)
		end
		@total_hand_score
	end

	def score_1(set:)
		puts set[0].to_s + "method call"
		@total_hand_score += 1
	end

	def score_2(set:)
		puts set[0].to_s + "method call"
		@total_hand_score += 2
	end
	
	def score_3(set:)
		puts set[0].to_s + "method call"
		@total_hand_score += 3
	end
	
	def score_4(set:)
		puts set[0].to_s + "method call"
		@total_hand_score += 4
	end	
	
	def score_5(set:)
		puts set[0].to_s + "method call"
		@total_hand_score += 5
	end
	
	def score_6(set:)
		puts set[0].to_s + "method call"
		@total_hand_score += 6
	end
end