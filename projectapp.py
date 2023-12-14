import bottle
from bottle import route, run, template, request, redirect
import dataset

# Connect to SQLite database
db = dataset.connect('sqlite:///mydatabase.db')

# Define the tables
artists_table = db['artists']
albums_table = db['albums']

# Define routes
@route('/')
def index():
    # Display a list of artists
    artists = artists_table.all()
    return template('index', artists=artists)
# Add a new route for handling search requests
@route('/search', method='get')
def search():
    # Retrieve the search term from the query string
    search_term = request.query.get('search', '').strip()

    # Perform the search on artists
    artists = artists_table.find(name={'ilike': f'%{search_term}%'})

    # Render the search results template
    return template('search_results', artists=artists, search_term=search_term)

@route('/artist/<artist_id>')
def view_artist(artist_id):
    # Display artist details and associated albums
    artist = artists_table.find_one(id=artist_id)
    albums = albums_table.find(artist_id=artist_id)
    return template('view_artist', artist=artist, albums=albums)

@route('/add_artist')
def add_artist():
    # Display form to add a new artist
    return template('add_artist')

@route('/add_artist', method='POST')
def do_add_artist():
    # Add a new artist to the database
    name = request.forms.get('name')
    artists_table.insert({'name': name})
    redirect('/')

@route('/edit_artist/<artist_id>')
def edit_artist(artist_id):
    # Display form to edit an existing artist
    artist = artists_table.find_one(id=artist_id)
    return template('edit_artist', artist=artist)

@route('/edit_artist/<artist_id>', method='POST')
def do_edit_artist(artist_id):
    # Update an existing artist in the database
    name = request.forms.get('name')
    artists_table.update({'id': artist_id, 'name': name}, ['id'])
    redirect('/')

@route('/delete_artist/<artist_id>')
def delete_artist(artist_id):
    # Delete an artist and associated albums from the database
    artists_table.delete(id=artist_id)
    albums_table.delete(artist_id=artist_id)
    redirect('/')
# Add routes for albums

@route('/add_album/<artist_id>')
def add_album(artist_id):
    # Display form to add a new album for a specific artist
    artist = artists_table.find_one(id=artist_id)
    return template('add_album', artist=artist)

@route('/add_album/<artist_id>', method='POST')
def do_add_album(artist_id):
    # Add a new album for a specific artist
    title = request.forms.get('title')
    albums_table.insert({'title': title, 'artist_id': artist_id})
    redirect(f'/artist/{artist_id}')

@route('/edit_album/<album_id>')
def edit_album(album_id):
    # Display form to edit an existing album
    album = albums_table.find_one(id=album_id)
    artist = artists_table.find_one(id=album['artist_id'])
    return template('edit_album', album=album, artist=artist)

@route('/edit_album/<album_id>', method='POST')
def do_edit_album(album_id):
    # Update an existing album in the database
    title = request.forms.get('title')
    album = albums_table.find_one(id=album_id)
    artist_id = album['artist_id']
    albums_table.update({'id': album_id, 'title': title, 'artist_id': artist_id}, ['id'])
    redirect(f'/artist/{artist_id}')

@route('/delete_album/<album_id>')
def delete_album(album_id):
    # Delete an album from the database
    album = albums_table.find_one(id=album_id)
    artist_id = album['artist_id']
    albums_table.delete(id=album_id)
    redirect(f'/artist/{artist_id}')
# Run the application
if __name__ == '__main__':
    bottle.run(host='localhost', port=8080, debug=True)