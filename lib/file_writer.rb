class FileWriter
  def write_braille(output)
    File.open(ARGV[1], "w+") do |f|
      output.each { |line| f.puts(line) }
    end
  end

  def write_english(output)
    file = File.open(ARGV[1], "w")
    file.puts output.join.to_s
    file.close
  end
end
