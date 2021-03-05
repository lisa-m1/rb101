puts "Please enter a number"
num1 = gets.chomp.to_i

puts "Please enter another number"
num2 = gets.chomp.to_i

puts "What oepration do you want to perform? add, subtract, multiply or divide?"
operation = gets.chomp

case operation
when "add"
  puts num1 + num2
when "subtract"
  puts num1 - num2
when "multiply"
  puts num1 * num2
when "divide"
  puts num1 / num2
end

