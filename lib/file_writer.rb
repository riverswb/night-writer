class FileWriter
  def write(output)
    filename = ARGV[1]
    File.open(filename, 'w') { |file| file.write(output) }
  end
end
