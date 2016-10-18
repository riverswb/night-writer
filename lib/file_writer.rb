class FileWriter
  def write_braille(output)
    filename = ARGV[1]
    File.open(filename, "w+") do |f|
      output.each { |line| f.puts(line) }
    end
  end

  def write_english(output)
    filename = ARGV[1]
    file = File.open(filename, "w")
    file.puts output
    file.close
  end
end
