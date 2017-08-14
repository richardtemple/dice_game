class Die
	attr_accessor :value, :image, :selected, :locked
	def initialize()
		@selected = false
		@locked   = false
		roll
	end

	def roll
		@value = rand(6) + 1
		@image = Gosu::Image.new("./media/#{@value}.png")
	end

	def clicked
		@selected = !@selected unless @locked
	end
end