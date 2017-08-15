class Die
	attr_accessor :value, :image, :selected, :locked
	def initialize()
		@selected = false
		@locked   = false
		@new_lock = false
		roll
	end

	def roll
		@value = rand(6) + 1
		@image = Gosu::Image.new("./media/#{@value}.png")
	end

	def clicked
		@selected = !@selected unless @locked
	end

	def lock
		if @locked
			@new_lock = false
		else
			@locked = true
			@new_lock = true
		end
	end

	def new_lock?
		@new_lock
	end

	def reset
		@new_lock = false
		@selected = false
		@locked   = false
	end
end