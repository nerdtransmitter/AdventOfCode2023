# Part 2 Solution Day 1 - Trebuchet

# check each line of input for spelled out digits
# if spelled out digits are found, convert to integer
def convert_spelled_out_digits(line)
  # initalize array of spelled out digits
  spelled_out_digits = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  # check each spelled out digit
  spelled_out_digits.each_with_index do |digit, index|
    # if spelled out digit is found in line
    if line.include?(digit)
      # replace spelled out digit with integer
      line.gsub!(digit, index.to_s)
    end
  end
  return line
end

# Remove all non-digits and ensure non-empty
def to_digits(line)
  converted_line = convert_spelled_out_digits(line)
  digits = converted_line.gsub(/\D/,'')
  return 0 if digits.empty?

  # Select the first and last digit and convert to integer
  pair = digits[0] + digits[-1]
  return pair.to_i
end

# Read lines from the file
input_lines = File.readlines('input.txt').map(&:chomp)

processed_lines = []

# Process each line as needed
input_lines.each do |line|
  processed_lines << to_digits(line)
end

total_sum = processed_lines.sum

# Sum all lines of input once converted to integers
output = "Sum of all calibration values considering some digits are spelled out: #{total_sum}"

# Write output to file
File.write('output.txt', output)
