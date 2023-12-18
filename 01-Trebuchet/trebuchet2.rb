# Part 2 Solution Day 1 - Trebuchet
def to_numeric_digits(line)
  digits = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
                         'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9' }

  new_line = ""
  index = 0
  # Loop through each character in the line
  while index < line.length
    if line[index] =~ /\d/  # Check if the current character is a digit
      new_line << line[index]
      index += 1
      next
    end

    matched = false
    digits.each do |word, digit|
      if line[index, word.length] == word # for each character, check if a spelled-out digit starts with that character
        new_line << digit # if matches, add digit to new line as its numeric value
        index += word.length - 1 # adjust index to skip over the spelled-out digit while keeping last character in case of double-digit like 'sevenine'
        matched = true
        break
      end
    end
    index += 1 unless matched
  end
  new_line
end

# Remove all non-digits and ensure non-empty
def to_integer(line)
  converted_line = to_numeric_digits(line).gsub(/\D/,'')
  # Return 0 if converted line is empty
  return 0 if converted_line.empty?

  # Select the first and last digit and convert to integer
  (converted_line[0] + converted_line[-1]).to_i
end

# Process each line of file, convert to integer and sum
def process_file(file_name)
  total_sum = File.open(file_name, 'r').sum do |line|
    to_integer(line.chomp)
  end

  "Sum of all calibration values considering some digits are spelled out: #{total_sum}"
end

# Write output to file
output = process_file('input.txt')

# Write output to file
File.write('output.txt', output)

# TEST CASES
# output = "SUM = #{total_sum}
#           5n: #{to_integer('5n')}
#           f3: #{to_integer('f3')}
#           eighthree: #{to_integer('eighthree')} - converted line: #{convert_spelled_out_integer('eighthree')}
#           sevenine: #{to_integer('sevenine')}
#           2eightwotg: #{to_integer('2eightwotg')}
#           test values:
#           two1nine: #{to_integer('two1nine')}
#           eightwothree: #{to_integer('eightwothree')} - converted line: #{convert_spelled_out_integer('eightwothree')}
#           abcone2threexyz: #{to_integer('abcone2threexyz')}
#           xtwone3four: #{to_integer('xtwone3four')} - converted line: #{convert_spelled_out_integer('xtwone3four')}
#           4nineeightseven2: #{to_integer('4nineeightseven2')}
#           zoneight234: #{to_integer('zoneight234')}
#           7pqrstsixteen: #{to_integer('7pqrstsixteen')}
#           RANDOM = oneight: #{to_integer('oneight')}
#           sum of test cases: #{to_integer('two1nine') + to_integer('eightwothree') + to_integer('abcone2threexyz') + to_integer('xtwone3four') + to_integer('4nineeightseven2') + to_integer('zoneight234') + to_integer('7pqrstsixteen')}"
