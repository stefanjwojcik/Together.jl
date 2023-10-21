## Functions to access the Together API for Large language models 
# Need to build HTTP request functions to access the Together API
# Based on this CURL code: 
# curl -X POST https://api.together.xyz/inference \
#-H 'Content-Type: application/json' \
#-H 'Authorization: Bearer XXXX' \
#-d '{
#"model": "togethercomputer/llama-2-70b-chat",
#"max_tokens": 512,
##"prompt": "",
#"request_type": "language-model-inference",
#"temperature": 0.7,
#"top_p": 0.7,
#"top_k": 50,
#"repetition_penalty": 1,
#"stream_tokens": true,
#"stop": [
#  "[/INST]",
#  "</s>"
#],
#"negative_prompt": "",
#"sessionKey": "2e59071178ae2b05e68015136fb8045df30c3680",
#"type": "chat"
#}'

using HTTP
using JSON

"""
# Example usage: 
model = "togethercomputer/llama-2-70b-chat"
max_tokens = 512
prompt = "what is the difference between a camel and an alpaca?"
request_type = "language-model-inference"
temperature = 0.7
top_p = 0.7
top_k = 50
repetition_penalty = 1
stream_tokens = false 
stop = ["[/INST]", "</s>"]
negative_prompt = ""
sessionKey = "2e59071178ae2b05e68015136fb8045df30c3680"
type = "chat"
r = together_inference(model, max_tokens, prompt, request_type, temperature, top_p, top_k, repetition_penalty, stream_tokens, stop, negative_prompt, sessionKey, type)
println(r["output"]["choices"][1]["text"])
"""
function together_inference(model, max_tokens, prompt, request_type, temperature, top_p, top_k, repetition_penalty, stream_tokens, stop, negative_prompt, sessionKey, type)
    # Build the JSON request
    request = Dict("model" => model, "max_tokens" => max_tokens, "prompt" => prompt, "request_type" => request_type, "temperature" => temperature, "top_p" => top_p, "top_k" => top_k, "repetition_penalty" => repetition_penalty, "stream_tokens" => stream_tokens, "stop" => stop, "negative_prompt" => negative_prompt, "sessionKey" => sessionKey, "type" => type)
    # Convert the request to JSON
    request_json = JSON.json(request)
    # Build the HTTP request
    r = HTTP.request("POST", "https://api.together.xyz/inference", ["Content-Type" => "application/json", "Authorization" => "Bearer $TOGETHER_API_KEY"], request_json)
    # Convert the response to JSON
    response_json = JSON.parse(String(r.body))
    # Return the response
    return response_json
end