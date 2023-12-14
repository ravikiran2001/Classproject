<!DOCTYPE html>
<html>
<head>
    <title>Edit Album</title>
</head>
<body>
    <h1>Edit Album</h1>
    <form action="/edit_album/{{album['id']}}" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="{{album['title']}}" required>
        <button type="submit">Save Changes</button>
    </form>
    <p><a href="/artist/{{artist['id']}}">Back to Artist Details</a></p>
</body>
</html>