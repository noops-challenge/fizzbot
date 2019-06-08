#
# Ruby automated fizzbot example
#
# Can you write a program that passes the fizzbot test?
#
require "net/http"
require "json"

def main
  # get started
  start = get_json('/fizzbot')

  # get the path to the first question
  first_question_path = start['nextQuestion']

  # The first question asks about our favorite programming language...
  get_json(first_question_path)

  # ...which is Ruby, of course!
  answer_result = send_answer(first_question_path, 'Ruby')

  # Answer each question, as log as we are correct
  while answer_result['result'] == 'correct' do
    # get the next question
    question_path = answer_result['nextQuestion']
    question = get_json(question_path)

    # your code to figure out the answer goes here
    answer = 'This is incorrect!'

    # send it to fizzbot
    answer_result = send_answer(question_path, answer)
  end
end

def send_answer(path, answer)
  post_json(path, { :answer => answer })
end

# get data from the api and parse it into a ruby hash
def get_json(path)
  puts "*** GET #{path}"

  response = Net::HTTP.get_response(build_uri(path))
  result = JSON.parse(response.body)
  puts "HTTP #{response.code}"

  puts JSON.pretty_generate(result)
  result
end

# post an answer to the noops api
def post_json(path, body)
  uri = build_uri(path)
  puts "*** POST #{path}"
  puts JSON.pretty_generate(body)

  post_request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
  post_request.body = JSON.generate(body)

  response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
    http.request(post_request)
  end

  puts "HTTP #{response.code}"
  result = JSON.parse(response.body)
  puts JSON.pretty_generate(result)
  result
end

def build_uri(path)
  URI.parse("https://api.noopschallenge.com" + path)
end

main()
