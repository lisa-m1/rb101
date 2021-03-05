puts "Please enter a number"
num1 = gets.chomp.to_i

puts "Please enter another number"
num2 = gets.chomp.to_i

puts "What oepration do you want to perform? add, subtract, multiply or divide?"
operation = gets.chomp

case operation
when "add"
  result = num1 + num2
when "subtract"
  result = num1 - num2
when "multiply"
  result = num1 * num2
when "divide"
  result = num1 / num2
end

puts result