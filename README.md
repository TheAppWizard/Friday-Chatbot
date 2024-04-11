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
 curl --location 'http://localhost:11434/api/chat' \
         --header 'Content-Type: application/json' \
         --data '{
           "model": "foodie_friday_llama2",
           "prompt":"What are chocolates?"
         }'
```




