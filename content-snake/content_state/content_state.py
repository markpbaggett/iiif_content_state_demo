import base64
import urllib.parse
import json


def encode_content_state(plain_content_state):
    data = json.loads(plain_content_state)
    compact_json = json.dumps(data, separators=(',', ':'), ensure_ascii=False)
    uri_encoded = urllib.parse.quote(compact_json, safe='')
    utf8_encoded = uri_encoded.encode("UTF-8")
    base64url = base64.urlsafe_b64encode(utf8_encoded)
    utf8_decoded = base64url.decode("UTF-8")
    base64url_no_padding = utf8_decoded.replace("=", "")
    return base64url_no_padding


if __name__ == "__main__":
    example = '{"id":"https://api.dc.library.northwestern.edu/api/v2/works/71153379-4283-43be-8b0f-4e7e3bfda275?as=iiif/canvas/access/2","type":"Canvas","partOf":[{"id":"https://api.dc.library.northwestern.edu/api/v2/works/71153379-4283-43be-8b0f-4e7e3bfda275?as=iiif","type":"Manifest"}]}'
    print(encode_content_state(example))
