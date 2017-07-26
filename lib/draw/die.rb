class Die
	attr_accessor :value, :image, :selected
	def initialize()
		roll
	end

	def roll
		@value = rand(5) + 1
		@image = Gosu::Image.new("./media/#{@value}.png")
	  @selected = false
	end

end