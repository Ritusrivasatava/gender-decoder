# Gender Decoder API

## How to start the API locally
```
uvicorn app.main:gender_decoder_api --reload
```
![Start API](/images/Start%20API.png)

*--reload flag will make server reloading automatically*

## How to query the API interactively
- Go to the browswer
- Type ```localhost:8000/docs```
![FastAPI Swagger UI](/images/FastAPI%20-%20Swagger%20UI.png)

## Input
- Click on **Post /gender_decoder**
- Click on **Try it out**
- You would see an image as follow
- Provide the job description to **job_description** in the body in JSON format
- Click **Execute** at the bottom
![Input to API](/images/Input%20to%20API.png)

## Results
Results are automatically generated with the following information:

- **Curl command** so you can copy/paste and run it in a terminal
- **Server response** with a **response body** and **response headers**
- **Response body** contains a JSON object that currently holds 2 keys: **gender_decoder_result** and **job description**
- **gender_decoder_result** currently holds 4 keys: **gender_tag**, **gendered_word_count**, **masculine words** and **feminine words**

![Results from API](/images/Results%20from%20API.png)
