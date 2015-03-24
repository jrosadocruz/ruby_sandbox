require './csv_reader.rb'

reader = CsvReader.new

# The arguments passed to your script are stored in the ARGV Array.
# Use ARGV variable to access the program’s command-line arguments, loading
# CSV data for each file specified on the command line.
# $ ruby stock_stats.rb data.csv
ARGV.each do |csv_file_name|
  STDERR.puts "Processing #{csv_file_name}"
  reader.read_in_csv_data(csv_file_name)
end

puts "Total value: $#{reader.total_value_in_stock}"
reader.print_each_isbn