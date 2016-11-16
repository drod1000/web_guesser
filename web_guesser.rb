require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params['guess']
  cheat = params['cheat']
  message = check_guess(guess)
  message << display_number if cheat == "true"
  erb :index, :locals => {:number => NUMBER, :message => message}
end

def check_guess(guess)
  return "Way too high!" if guess.to_i  > NUMBER + 5
  return "Too high!" if guess.to_i > NUMBER
  return "Way too low!" if guess.to_i < NUMBER - 5
  return "Too low!" if guess.to_i < NUMBER
  "You got it right! #{display_number}"
end

def display_number
  "The secret number is #{NUMBER}"
end
