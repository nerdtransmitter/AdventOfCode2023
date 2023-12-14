# Part 2 Solution Day 1 - Trebuchet
def convert_spelled_out_digits(line)
  spelled_out_digits = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
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
    spelled_out_digits.each do |word, digit|
      if line[index, word.length] == word # for each character, check if a spelled-out digit starts with that character
        new_line << digit # if matches, add digit to new line as its numeric value
        # line[index, word.length] = digit
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
def to_digits(line)
  converted_line = convert_spelled_out_digits(line)
  digits = converted_line.gsub(/\D/,'')
  # Check if resulting string is empty or invalid
  return 0 if digits.empty? || digits.nil?

  # Select the first and last digit and convert to integer
  pair = digits[0] + digits[-1]
  return pair.to_i
end

# Read lines from the file
input_lines = File.readlines('input.yml').map(&:chomp)

processed_lines = []

# Process each line as needed
input_lines.each do |l|
  processed_lines << to_digits(l)
end

total_sum = processed_lines.sum

# Sum all lines of input once converted to integers
# output = "Sum of all calibration values considering some digits are spelled out: #{total_sum}"
# output = "one23four converts to #{to_digits('one23four')} and twothreefour converts to #{to_digits('twothreefour')}. sahjf converts to #{to_digits('sahjf')}
#           zoneight234 converts to #{to_digits('zoneight234')} and 234 converts to #{to_digits('234')}."

output = "SUM = #{total_sum}
          5n: #{to_digits('5n')}
          f3: #{to_digits('f3')}
          eighthree: #{to_digits('eighthree')} - converted line: #{convert_spelled_out_digits('eighthree')}
          sevenine: #{to_digits('sevenine')}
          2eightwotg: #{to_digits('2eightwotg')}
          test values:
          two1nine: #{to_digits('two1nine')}
          eightwothree: #{to_digits('eightwothree')} - converted line: #{convert_spelled_out_digits('eightwothree')}
          abcone2threexyz: #{to_digits('abcone2threexyz')}
          xtwone3four: #{to_digits('xtwone3four')} - converted line: #{convert_spelled_out_digits('xtwone3four')}
          4nineeightseven2: #{to_digits('4nineeightseven2')}
          zoneight234: #{to_digits('zoneight234')}
          7pqrstsixteen: #{to_digits('7pqrstsixteen')}
          RANDOM = oneight: #{to_digits('oneight')}
          sum of test cases: #{to_digits('two1nine') + to_digits('eightwothree') + to_digits('abcone2threexyz') + to_digits('xtwone3four') + to_digits('4nineeightseven2') + to_digits('zoneight234') + to_digits('7pqrstsixteen')}"

# Write output to file
File.write('output.txt', output)
