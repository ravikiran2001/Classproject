<!DOCTYPE html>
<html>
<head>
    <title>Edit Artist</title>
</head>
<body>
    <h1>Edit Artist</h1>
    <form action="/edit_artist/{{artist['id']}}" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="{{artist['name']}}" required>
        <button type="submit">Save Changes</button>
    </form>
    <p><a href="/">Back to Artists List</a></p>
</body>
</html>