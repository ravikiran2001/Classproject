<!DOCTYPE html>
<html>
<head>
    <title>Add New Artist</title>
</head>
<body>
    <h1>Add New Artist</h1>
    <form action="/add_artist" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Add Artist</button>
    </form>
    <p><a href="/">Back to Artists List</a></p>
</body>
</html>