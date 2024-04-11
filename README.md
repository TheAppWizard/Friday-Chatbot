# Friday-Chatbot

Friday ChatBot Backend Implementation

## Ollama

Ollama provides a simple API for creating, running, and managing language models. It also offers a library of pre-built models that can be easily integrated into your applications.

### Features
- Create custom language models
- Run and manage pre-built models
- Easy integration with applications


### Downloading Ollama
![Ollama Image](https://github.com/TheAppWizard/Friday-Chatbot/assets/70090469/0f6e463e-dc16-46df-928c-ea40f5ed90b3)

### Pulling Model 
```terminal
 ollama pull llama2
```


### First Run
```terminal
 ollama run llama2
```


### Ollama : llama2
![Ollama Image](https://github.com/TheAppWizard/Friday-Chatbot/assets/70090469/862ef660-ef32-4bf0-af72-98873b4138e8)


### Modifying Model
```terminal
 nano foodie_friday
```

### Nano File
![Nano Image](https://github.com/TheAppWizard/Friday-Chatbot/assets/70090469/2f05b7a3-379f-4da8-a63e-e6956fca7c4e)


### Creating Model
```terminal
 ollama create foodie_friday_llama2 -f ./foodie_friday
```

### Running Foodie-Friday
![Friday Image](https://github.com/TheAppWizard/Friday-Chatbot/assets/70090469/aa247bcb-b8ec-4a18-abb9-da2b6b5d591a)


### Running As API Service (Local Host)
```curl
 curl --location 'http://localhost:11434/api/generate' \
         --header 'Content-Type: application/json' \
         --data '{
           "model": "foodie_friday_llama2",
           "prompt":"What are chocolates?"
         }'
```

## NGROK 
ngrok is a tool that allows you to expose a local server or application running on your machine to the internet. It creates a secure tunnel from a public URL to your local machine, enabling you to access your local development environment from anywhere.

![NGROK Image](https://github.com/TheAppWizard/Friday-Chatbot/assets/70090469/6db6863e-f2d4-4a46-8454-057c053d936d)



### Convert Local Server to Public URL
- Run Model
```terminal
 ollama run foodie_friday_llama2
```

- Convert To Public URL
```terminal
 ngrok http 11434 --host-header="localhost:11434"
```

![NGROK Panel](https://github.com/TheAppWizard/Friday-Chatbot/assets/70090469/8071c54f-39a1-43b0-b811-eaa83d30005c)



### Running As API Service (Public URL)
```curl
 curl --location 'https://defc-182-48-225-219.ngrok-free.app/api/generate' \
         --header 'Content-Type: application/json' \
         --data '{
           "model": "foodie_friday_llama2",
           "prompt":"What are chocolates?"
         }'
```

## UI Inspiration (Messenger Dashboard Web App : By Golo : Dribble)
![UI Inspiration](https://github.com/TheAppWizard/Friday-Chatbot/assets/70090469/cc97ae3b-e80b-4042-8eed-3c81b6ba651a)





## Creating UI in SwiftUI / Flutter 
I chose Flutter for Hybrid Development
![Untitled](https://github.com/TheAppWizard/Friday-Chatbot/assets/70090469/1583792b-9411-4d2b-bc9c-b3ce4bb63ec5)



