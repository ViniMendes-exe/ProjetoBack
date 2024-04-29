module Employee 
    include HTTParty
    base_uri 'https://628670f0f0e8f0bb7c164350.mockapi.io'
    format :json
    headers 'Content-Type': 'application/json'
end