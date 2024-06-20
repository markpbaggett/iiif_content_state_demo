<!DOCTYPE html>
<html lang="en" data-theme="halloween">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IIIF Content State Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.2/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container mx-auto">
        <h1 class="text-4xl text-center text-primary">IIIF Content State Demo</h1>
        <p class="mt-4 text-center text-secondary-content" style="padding-bottom: 20px;">Add IIIF content and load it in Clover with <a class="text-info" href="https://iiif.io/api/content-state/1.0/">Content State</a></p>
        <div class="text-center">
            % if data['show_results']:
                <div style="padding-bottom: 20px;">
                    <button class="btn btn-secondary" onclick="my_modal_1.showModal()">View in Clover</button>
                </div>
                <dialog id="my_modal_1" class="modal">
                  <div class="modal-box" style="max-width: 800px;">
                    <iframe src="{{data['results']}}" width="750" height="600"></iframe>
                    <div class="modal-action">
                      <form method="dialog">
                        <button class="btn btn-secondary">Close</button>
                      </form>
                    </div>
                  </div>
                </dialog>
                <form action="/" method="post">
                    <textarea class="textarea textarea-bordered" placeholder="{{ data['example']['body'] }}" name="field" rows="10" cols="50">{{ data['example']['body'] }}</textarea>
                    <br/>
                    <button class="btn btn-primary" type="submit">Submit</button>
                </form>
            % else:
                <form action="/" method="post">
                    <br/>
                    <label class="text-center text-secondary" style="padding-bottom: 20px;">{{data['example']['text']}}</label>
                    <br/>
                    <textarea class="textarea textarea-bordered" placeholder="{{ data['example']['body'] }}" name="field" rows="10" cols="50">{{ data['example']['body'] }}</textarea>
                    <br/>
                    <button class="btn btn-primary" type="submit">Submit</button>
                </form>
            % end
        </div>
    </div>
</body>
</html>
