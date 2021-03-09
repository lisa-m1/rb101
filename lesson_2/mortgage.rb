def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num.to_s && num.to_i > 0
end

def valid_float?(num)
  num.to_f.to_s == num.to_s && num.to_f > 0
end

MONTHS_IN_A_YEAR = 12
INVALID_NUMBER = "This isn't a valid positive number. Please try again."

prompt("Welcome to the mortgage calculator!")

loop do
  loan_amount = ''
  loop do
    prompt("Please enter the loan amount rounded to the nearest dollar:")
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_i
      break
    else
      prompt(INVALID_NUMBER)
    end
  end

  annual_rate = ''
  loop do
    prompt("Please enter the interest rate with one decimal place")
    prompt("(3.5 for 3.5%; 5.0 for 5%)")
    annual_rate = gets.chomp
    if valid_float?(annual_rate)
      annual_rate = annual_rate.to_f
      break
    else
      prompt(INVALID_NUMBER)
    end
  end

  loan_duration_years = ''
  loop do
    prompt("Please enter your loan duration in years:")
    loan_duration_years = gets.chomp
    if valid_number?(loan_duration_years)
      loan_duration_years = loan_duration_years.to_i
      break
    else
      prompt(INVALID_NUMBER)
    end
  end

  loan_amount = loan_amount.to_i

  annual_rate /= 100
  monthly_rate = annual_rate / MONTHS_IN_A_YEAR

  loan_duration_months = loan_duration_years * MONTHS_IN_A_YEAR

  monthly_payment = loan_amount *
                    (monthly_rate / 
                    (1 - (1 + monthly_rate)**(-loan_duration_months)))

  puts "Yout monthly payment is #{monthly_payment.round(2)}"

  prompt("Do you want to perfom another calculation? (y/n)")
  calc_again = gets.chomp
  break unless calc_again.downcase.start_with?('y')
end
