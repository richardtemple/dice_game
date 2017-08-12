class Die
	attr_accessor :value, :image, :selected
	def initialize()
		@selected = false
		roll
	end

	def roll
		@value = rand(6) + 1
		@image = Gosu::Image.new("./media/#{@value}.png")
	  # @selected = true
	end

end