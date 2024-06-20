from bottle import Bottle, request, template
from content_state import encode_content_state

app = Bottle()

@app.route('/')
def form():
    return '''
        <form action="/submit" method="post">
            <label for="field">Request</label><br>
            <textarea id="field" name="field" rows="30" cols="50"></textarea><br>
            <input value="Submit" type="submit" />
        </form>
    '''

@app.route('/check')
def index():
    data = {
        'example': '{"id":"https://api.dc.library.northwestern.edu/api/v2/works/71153379-4283-43be-8b0f-4e7e3bfda275?as=iiif/canvas/access/2","type":"Canvas","partOf":[{"id":"https://api.dc.library.northwestern.edu/api/v2/works/71153379-4283-43be-8b0f-4e7e3bfda275?as=iiif","type":"Manifest"}]}',
        'show_results': False,
        'results': ''
    }
    return template('index', data=data)

# Route to handle the form submission
@app.route('/submit', method='POST')
def submit():
    field_data = request.forms.get('field')
    x = encode_content_state(field_data)
    data = {
        'example': field_data,
        'show_results': True,
        'results': f"https://samvera-labs.github.io/clover-iiif/?iiif-content={x}"
    }
    return template('index', data=data)


if __name__ == '__main__':
    app.run(debug=True, reloader=True)