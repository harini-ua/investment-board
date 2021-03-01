<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
{{--    <link href="{{ mix('/css/app.css') }}" rel="stylesheet">--}}
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap" rel="stylesheet">
    <link href="{{ mix('/css/main.css') }}" rel="stylesheet">

    {{-- Inertia --}}
    <script src="https://polyfill.io/v3/polyfill.min.js?features=smoothscroll,NodeList.prototype.forEach,Promise,Object.values,Object.assign" defer></script>

    {{-- Ping CRM --}}
{{--    <script src="https://polyfill.io/v3/polyfill.min.js?features=String.prototype.startsWith" defer></script>--}}

    <script src="{{ mix('/js/app.js') }}" defer></script>
    @routes
</head>
    <body>
        <div style="position: absolute; height: 0; overflow: hidden;" class="icons-sprite">
            @include('page.icons')
        </div>
        @inertia
</body>
</html>
