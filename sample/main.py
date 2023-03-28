import ssl
from urllib.request import urlopen, Request

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url = "https://jsonplaceholder.typicode.com/posts/1"

if not url.startswith("http"):
    raise RuntimeError("Incorrect and possibly insecure protocol in url")

httprequest = Request(url, headers={"Accept": "application/json"})

with urlopen(httprequest, context=ctx) as response:
    print(response.status)
    print(response.read().decode())
    print('Completed Successfully!')
    f = open('ux0:app/PYTH00003/Hello.txt', 'w')
    f.write('Hello from Python 3!')
    f.close()