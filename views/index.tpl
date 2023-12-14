<!DOCTYPE html>
<html>
<head>
    <title>Artists List</title>
</head>
<body>
    <h1>Artists</h1>
    <form action="/search" method="get">
        <label for="search">Search:</label>
        <input type="text" id="search" name="search">
        <button type="submit">Search</button>
    </form>
    <ul>
        % for artist in artists:
            <li>
                <a href="/artist/{{artist['id']}}">{{artist['name']}}</a>
                - <a href="/add_album/{{artist['id']}}">Add Album</a>
                - <a href="/edit_artist/{{artist['id']}}">Edit Artist</a>
                - <a href="/delete_artist/{{artist['id']}}">Delete Artist</a>
            </li>
        % end
    </ul>
    <p><a href="/add_artist">Add New Artist</a></p>
</body>
</html>