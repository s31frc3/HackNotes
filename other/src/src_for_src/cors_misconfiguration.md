How to Spot CORS Misconfigurations?

It is almost year 2024, yet I continue to discover CORS misconfigurations!

Here's my approach to finding CORS Issues:

1. Nuclei Scan - Identify vulnerable targets with the cors-misconfig.yaml nuclei template using the command nuclei -u target.com -t cors-misconfig.yaml (https://github.com/projectdiscovery/nuclei-templates/blob/ee271cf0eb99d7e90e528d0a45b7dc291c2d7b17/http/vulnerabilities/generic/cors-misconfig.yaml)
2. Manual Approach - If you're manually hunting on a target app and believe that specific GET/POST/PATCH/PUT/DELETE endpoints were missed by nuclei, add an Origin header to your requests with null or <your_arbitrary_origin>. Check the response headers for Access-Control-Allow-Origin: your_arbitrary_origin or null and Access-Control-Allow-Credentials: true.
3. Craft your POC - To ensure your report doesn't get closed as "Informative" or "NA," provide a working PoC. Here's JavaScript code I host on my attacker-controlled server to demonstrate CORS misconfiguration on a sensitive endpoint:

```js
var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function() {
    if(xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
        alert(xhr.responseText);
    }
};
```

xhr.open('GET', 'http://targetapp/api/v1/user', true); 
xhr.withCredentials = true; 
xhr.send(null);