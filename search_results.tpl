<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results for "{{search_term}}"</h1>
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
    <p><a href="/">Back to Artists List</a></p>
</body>
</html>