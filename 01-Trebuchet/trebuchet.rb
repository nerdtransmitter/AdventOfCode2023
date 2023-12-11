# day 1
# Read lines from the file
input_lines = File.readlines('input.txt').map(&:chomp)

processed_lines = []

def to_digits(string)
  # Remove all non-digits and ensure non-empty
  digits = string.gsub(/\D/,'')
  return 0 if digits.empty?

  # Select the first and last digit and convert to integer
  pair = digits[0] + digits[-1]
  return pair.to_i
end
# Process each line as needed
input_lines.each do |line|
  processed_lines << to_digits(line)
end

total_sum = processed_lines.sum

output = "Sum of all calibration values: #{total_sum}"

# Write output to file
File.write('output.txt', output)
