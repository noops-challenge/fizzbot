## Find fizzbot at https://api.noopschallenge.com/fizzbot

---


### Get started with fizzbuzz

`GET /fizzbot`

`HTTP 200`

```
{
  "message": "Thank you for your application to Noops Inc.\n\nOur automated fizzbot interview process will help us determine if you have what it takes to become a Noop.\n\nFor each question, you will GET the question and then give us the answer back to the same URL.\nYou will also find the URL for the next question in the nextQuestion parameter for each response.\n\nThe first question is at https://api.noopschallenge.com/fizzbot/1.\n\nGood Luck\n",
  "nextQuestion": "/fizzbot/questions/1"
}
```


### Get first question

`GET /fizzbot/questions/1`

`HTTP 200`

```
{
  "message": "What is your favorite programming language?\nMine is COBOL, of course.\nPOST your answer back to this URL in JSON format. If you are having difficulties, see the exampleResponse provided.",
  "exampleResponse": {
    "answer": "COBOL"
  }
}
```


### Answer the starter question

First, tell us your favorite programming language.

`POST /fizzbot/questions/1`


```
{
 "answer": "NoopScript"
}
```

`HTTP 200`

```
{
  "result": "correct",
  "message": "Of course. How interesting. Are you ready for your first REAL question?",
  "nextQuestion": "/fizzbot/questions/1234567890"
}
```

### Get the next question

`GET /fizzbot/questions/1234567890`

`HTTP 200`

```
{
  "message": "FizzBuzz is the name of the game.\nHere's a list of numbers.\nSend me back a string as follows:\nFor each number:\nIf it is divisible by 3, print \"Fizz\".\nIf it is divisible by 5, print \"Buzz\".\nIf it is divisible by 3 and 5, print \"FizzBuzz\".\nOtherwise, print the number.\n\nEach entry in the string should be separated by a space.\n\nFor example, if the numbers are [1, 2, 3, 4, 5], you would send back:\n\n{\n  \"answer\": \"1 2 Fizz 4 Buzz\"\n}\n",
  "rules": [
    {
      "number": 3,
      "response": "Fizz"
    },
    {
      "number": 5,
      "response": "Buzz"
    }
  ],
  "numbers": [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
  ],
  "exampleResponse": {
    "answer": "1 2 Fizz 4 Buzz..."
  }
}
```


### Answer the next question


`POST /fizzbot/questions/1234567890`


```
{
 "answer": "your answer goes here"
}
```

`HTTP 200`

```
{
  "nextQuestion": "/fizzbot/questions/0987654321",
  "message": "You're off to a great start!",
  "result": "correct"
}
```

