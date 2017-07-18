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
		if set.count > 2
			@total_hand_score += 1000
			(set.count - 3).times {@total_hand_score += 1000}
		else
			@total_hand_score += set.count * 100 unless set.count == 3
		end
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
		if set.count > 2
			@total_hand_score += 500
			(set.count - 3).times {@total_hand_score += 500}
		else
			@total_hand_score += set.count * 50 unless set.count == 3
		end
	end
	
	def score_6(set:)
		puts set[0].to_s + "method call"
		@total_hand_score += 6
	end
end