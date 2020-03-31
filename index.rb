class Counter
		attr_accessor :amount, :files
		def initialize(amount, files)
				self.amount = amount
				self.files = files
		end

		def count
				@files = Dir.glob("src/**/*").find_all {|file| /\.\w+$/.match?(file)}
				@files.each do |file|
						p file
						@amount += File.open(file).readlines.count
				end
		end
end

counter = Counter.new(0, [])
counter.count
puts counter.amount

