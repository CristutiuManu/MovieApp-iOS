# MovieApp-iOS
API

Se va folosi api-ul: https://developers.themoviedb.org/3/getting-started/introduction
Ecrane

1.	Spashscreen
2.	Ecran de onboarding cu preferinte - Formular in care alege tipul de filme preferat(drama, dragoste), actori preferati, keywords care se filtreaza automat in lista de filme
3.	Lista de filme - cu filtrare si search dupa nume
4.	Adaugare de filme la favorite sau watched
5.	Lista de watched si favorite
6.	Ecran de detaliu la film

Splashscreen

Acest ecran va fi afisat la deschiderea aplicatiei si va disparea cand aplicatia s-a terminat de incarcat si este pregatita pentru deschiderea primului ecran. Va contine un label centrat vertical si orizontal cu numele aplicatiei(MovieApp) si un background de o culoare aleasa diferit de fiecare echipa.
Onboarding - Preferences screen

La deschiderea aplicatiei se va verifica daca preferintele au fost salvate in Room si doar daca nu au fost salvate atunci se va deschide ecranul de Preferinte. Daca preferintele au fost salvate se va deschide Main screen si anume Search movies screen.
Ecranul de onboarding va contine un formular cu 3 campuri: Actors, Genres si Keywords si va avea titlul: Preferences. La apasarea pe campurile de Actors si Genres se va deschide un alt ecran de multi-select list de unde utilizatorul va putea selecta mai multi actori/genre. La apasarea pe campul Keywords se va deschide tastatura si userul va introduce cuvinte despartite prin virgula. Aceste preferinte vor fi folosite ca default filters in ecranul Search movies screen. Datele selectate vor putea fi salvate folosind butonul de Save din navigation bar, care va ramane disabled pana cand toate campurile vor fi completate.
Ecranele de multi-select list ce contin Actors sau Movies vor incarca datele la deschiderea ecranului dintr-un request si vor afisa datele in celule selectabile. Dupa selectarea unor elemente daca userul apasa butonul Back selectia nu se va salva, daca apasa butonul Save datele vor fi trimise la ecranul de preferinte. Butonul de save va fi disabled pana cand minim un element va fi selectat. 

Exemple requesturi:

https://api.themoviedb.org/3/person/popular?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US&page=1

{
  "page": 1,
  "total_results": 19139,
  "total_pages": 957,
  "results": [
    {
      "popularity": 37.57,
      "id": 87167,
      "profile_path": "/q0MPIW1uBsENV2WuW8VuEyZDioN.jpg",
      "name": "Jeannette Sousa",
      "known_for": [
        {
          "vote_average": 6.9,
          "vote_count": 3654,
          "id": 49018,
          "video": false,
          "media_type": "movie",
          "title": "Insidious",
          "popularity": 17.207,
          "poster_path": "/6Tjg6DWVo2cpqDLxrOQNw1UvIMB.jpg",
          "original_language": "en",
          "original_title": "Insidious",
          "genre_ids": [
            27,
            53
          ],
          "backdrop_path": "/xVNR5eperbCm1DI1JfGhUXd4lqm.jpg",
          "adult": false,
          "overview": "A family discovers that dark spirits have invaded their home after their son inexplicably falls into an endless sleep. When they reach out to a professional for help, they learn things are a lot more personal than they thought.",
          "release_date": "2010-09-13"
        }
]
}

https://api.themoviedb.org/3/genre/movie/list?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US

{
  "genres": [
    {
      "id": 28,
      "name": "Action"
    },
    {
      "id": 12,
      "name": "Adventure"
    },
    {
      "id": 16,
      "name": "Animation"
    },
    {
      "id": 35,
      "name": "Comedy"
    },
    {
      "id": 80,
      "name": "Crime"
    },
    {
      "id": 99,
      "name": "Documentary"
    },
    {
      "id": 18,
      "name": "Drama"
    }
]
}
