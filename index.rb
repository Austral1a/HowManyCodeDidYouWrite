class Counter
  attr_accessor :amount
  attr_writer :files

  def initialize(amount=0, files=Dir.glob('src/**/*'))
    self.amount = amount
    self.files = files
  end

  # Showing files
  def files
    @files.each do |file|
      p file
    end
  end

  # This method allows you to choose whatever regex pattern you want to
  def get_files_with_pattern(pattern)
    @files = @files.find_all { |file| pattern.match?(file) }
    @files
  end

  # This func removing files that you don't want count, with regex pattern
  def remove_files_with_pattern(pattern)
    @files = @files.reject { |file| pattern.match?(file) }
    @files
  end

  # This method count lines in the files which you chose by specific pattern
  def count
    @files.each do |file|
      @amount += File.open(file).readlines.count
    end
    @amount
  end
end

counter = Counter.new
counter.get_files_with_pattern(/\.\w+$/i)
counter.remove_files_with_pattern(/\.(css|json|map)$/i)
p counter.count
