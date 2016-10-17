class FileWriter
  def write(output)
    filename = ARGV[1]
    File.open(filename, "w+") do |f|
      output.each { |line| f.puts(line) }
    end
  end
end
