<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        .page {
            margin-top: 205px;
            height: 100%;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: row;
        }
        .page h1 {
            font-size: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 10%;
            font-family: 'Arial', sans-serif;
            color: black;
            text-shadow: 2px 5.5px 3px white;
            animation-name: fadeIn;
            animation-duration: 2s;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>
<div class="page">
    <h1>Welcome</h1>
</div>
</body>

</html>