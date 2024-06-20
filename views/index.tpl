<!DOCTYPE html>
<html lang="en" data-theme="dracula">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IIIF Content State Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.2/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container mx-auto">
        <h1 class="text-4xl text-center">IIIF Content State Demo</h1>
        <p class="mt-4 text-center">Add IIIF content and load it in Clover with Content State</p>
        <div class="text-center">
            % if data['show_results']:
                <button class="btn" onclick="my_modal_1.showModal()">View in Clover</button>
                <dialog id="my_modal_1" class="modal">
                  <div class="modal-box" style="max-width: 800px;">
                    <iframe src="{{data['results']}}" width="750" height="600"></iframe>
                    <div class="modal-action">
                      <form method="dialog">
                        <button class="btn">Close</button>
                      </form>
                    </div>
                  </div>
                </dialog>
                <form action="/" method="post">
                    <textarea class="textarea textarea-bordered" placeholder="{{ data['example'] }}" name="field" rows="10" cols="50">{{ data['example'] }}</textarea>
                    <br/>
                    <button class="btn btn-primary" type="submit">Submit</button>
                </form>
            % else:
                <form action="/" method="post">
                    <textarea class="textarea textarea-bordered" placeholder="{{ data['example'] }}" name="field" rows="10" cols="50">{{ data['example'] }}</textarea>
                    <br/>
                    <button class="btn btn-primary" type="submit">Submit</button>
                </form>
            % end
        </div>
    </div>
</body>
</html>
