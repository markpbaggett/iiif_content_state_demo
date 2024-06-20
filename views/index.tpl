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
        <!-- Open the modal using ID.showModal() method -->
        <div class="text-center">
            % if data['show_results']:
                <div class="card w-96 bg-base-100 shadow-xl text-center">
                  <div class="card-body text-center">
                    <h2 class="card-title">Success</h2>
                    <p><a href="{{data['results']}}">See Item in Clover</a></p>
                    <div class="card-actions justify-end">
                      <button class="btn btn-primary">Buy Now</button>
                    </div>
                  </div>
                </div>
            % else:
                <form action="/submit" method="post">
                    <textarea class="textarea textarea-bordered" placeholder="{{ data['example'] }}" name="field" rows="10" cols="50"></textarea>
                    <br/>
                    <button class="btn btn-primary" type="submit">Submit</button>
                </form>
            % end
        </div>
    </div>
</body>
</html>
