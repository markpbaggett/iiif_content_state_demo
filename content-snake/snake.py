from bottle import Bottle, request, template
from content_state import encode_content_state
import random

app = Bottle()

@app.route('/')
def index():
    examples = [
        {
            'body': '{"id":"https://api.dc.library.northwestern.edu/api/v2/works/71153379-4283-43be-8b0f-4e7e3bfda275?as=iiif/canvas/access/2","type":"Canvas","partOf":[{"id":"https://api.dc.library.northwestern.edu/api/v2/works/71153379-4283-43be-8b0f-4e7e3bfda275?as=iiif","type":"Manifest"}]}',
            'text': 'Open the 3rd Canvas on Zagna "lugna" from Northwestern University'
        },
        {
            'body': '{"id":"https://digital.lib.utk.edu/notdereferenceable/assemble/manifest/rftaart/75/canvas/1","type":"Canvas","partOf":[{"id":"https://digital.lib.utk.edu/assemble/manifest/rftaart/75","type":"Manifest"}]}',
            'text': 'Open the 2nd Canvas which is a Video on Just a Manual from the University of Tennessee'

        },
        {
            'body': '{"id":"https://raw.githubusercontent.com/markpbaggett/static_iiif/main/manifests/tamu/a0379f2d-2381-4abc-a259-a52bb1ba0b14.json/canvas/5","type":"Canvas","partOf":[{"id":"https://raw.githubusercontent.com/markpbaggett/static_iiif/main/manifests/tamu/a0379f2d-2381-4abc-a259-a52bb1ba0b14.json","type":"Manifest"}]}',
            'text': 'Open the 5th page from a book from the Primeros Libros collection'
        },
        {
            'body': '{"id":"https://digital.lib.utk.edu/assemble/manifest/rftaart/32","type": "Manifest","partOf":[{"id":"https://digital.lib.utk.edu/assemble/collection/collections/rftaart","type": "Collection"}]}',
            'text': 'Open "Dolly Parton Donates" in the Rising from the Ashes Art Collection'
        },
        {
            'body': '{"@context":"http://iiif.io/api/presentation/3/context.json","id":"https://iiif.io/api/cookbook/recipe/0021-tagging/annotation/p0002-tag","type":"Annotation","motivation":["contentState"],"target":{"id":"https://iiif.io/api/cookbook/recipe/0021-tagging/canvas/p1#xywh=265,661,1260,1239","type": "Canvas","partOf": [{"id":"https://iiif.io/api/cookbook/recipe/0021-tagging/manifest.json","type": "Manifest"}]}}',
            'text': 'Show Tagged Annotation on "Picture of Göttingen taken during the 2019 IIIF Conference"'
        }
    ]
    data = {
        'example': random.choice(examples),
        'show_results': False,
        'results': ''
    }
    return template('index', data=data)

# Route to handle the form submission
@app.route('/', method='POST')
def submit():
    field_data = request.forms.get('field')
    x = encode_content_state(field_data)
    data = {
        'example': {'body': field_data, 'text': 'User submitted content'},
        'show_results': True,
        'results': f"https://samvera-labs.github.io/clover-iiif/?iiif-content={x}"
    }
    return template('index', data=data)


if __name__ == '__main__':
    app.run(debug=True, reloader=True)