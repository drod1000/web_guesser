require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :guess => guess, :message => message}
end

def check_guess(guess)
  return "Way too high!" if guess.to_i  > NUMBER + 5
  return "Too high!" if guess.to_i > NUMBER
  return "Way too low!" if guess.to_i < NUMBER - 5
  return "Too low!" if guess.to_i < NUMBER
  "You got it right! The secret number is #{NUMBER}"
end
