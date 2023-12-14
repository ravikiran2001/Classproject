<!DOCTYPE html>
<html>
<head>
    <title>Add New Album for {{artist['name']}}</title>
</head>
<body>
    <h1>Add New Album for {{artist['name']}}</h1>
    <form action="/add_album/{{artist['id']}}" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>
        <button type="submit">Add Album</button>
    </form>
    <p><a href="/artist/{{artist['id']}}">Back to Artist Details</a></p>
</body>
</html>