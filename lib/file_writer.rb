class FileWriter
  def write(output)
    filename = ARGV[1]
    # File.write(filename, output)
    File.open(filename, "w+") do |f|
      # binding.pry
      output.each { |line| f.puts(line) }
    end
  end
end
