class HandScore

	def initialize
		@total_hand_score = 0
	end

	def score_sets(sets:)
		# require 'pry'; binding.pry
		puts "in score_sets: #{sets}"

		begin
			sets.each do |set|
				puts "set count: #{set.count}"
				send("score_#{set[0].to_s}", set: set)
			end
			@total_hand_score
		rescue RuleError => e
			0
		end
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
		if set.count < 3
			raise RuleError.new
		end
		@total_hand_score += 200
		if set.count > 3
			(set.count - 3).times {@total_hand_score += 200}
		end
	end
	
	def score_3(set:)
		if set.count < 3
			raise RuleError.new
		end
		@total_hand_score += 300
		if set.count > 3
			(set.count - 3).times {@total_hand_score += 300}
		end
	end
	
	def score_4(set:)
		if set.count < 3
			raise RuleError.new
		end
		@total_hand_score += 400
		if set.count > 3
			(set.count - 3).times {@total_hand_score += 400}
		end
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
		if set.count < 3
			raise RuleError.new
		end
		@total_hand_score += 600
		if set.count > 3
			(set.count - 3).times {@total_hand_score += 600}
		end
	end
end