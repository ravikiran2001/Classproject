<!DOCTYPE html>
<html>
<head>
    <title>{{artist['name']}}</title>
</head>
<body>
    <h1>{{artist['name']}}</h1>
    <h2>Albums</h2>
    <ul>
        % for album in albums:
            <li>
                {{album['title']}}
                - <a href="/edit_album/{{album['id']}}">Edit Album</a>
                - <a href="/delete_album/{{album['id']}}">Delete Album</a>
            </li>
        % end
    </ul>
    <p><a href="/edit_artist/{{artist['id']}}">Edit Artist</a></p>
    <p><a href="/delete_artist/{{artist['id']}}">Delete Artist</a></p>
</body>
</html>