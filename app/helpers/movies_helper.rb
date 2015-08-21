module MoviesHelper
	class Fixnum
	  def to_mega_octet
	        (self*0.000001).to_i
	  end
	end
end
