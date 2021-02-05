//
//  MovieDetailsViewController.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 30/10/2020.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var movieDetailPoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var detailMovie: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var watchedButton: UIButton!
    private var id: Int = 0
    private var moviesDetails: MovieDetails?
    private let viewModel: MovieDetailsViewModel
    
    init(id: Int, viewModel: MovieDetailsViewModel) {
        self.id = id
        self.viewModel = viewModel
        moviesDetails = MovieDetails()
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieId = id
//        let service = Service(baseUrl:
//                                "https://api.themoviedb.org/3/movie/\(movieId)?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US")
//        service.getMovieDetails(endPoint: "")
//        service.callBackDetailsMovie = { movieDetails ,status ,message in
//            self.moviesDetails = movieDetails
        viewModel.getMovieDetailsNetworking(success: { [weak self] (movieDetails) in
            DispatchQueue.main.async {
            self?.movieTitle.text = movieDetails?.title
            self?.releaseDate.text = movieDetails?.releaseDate
            self?.detailMovie.text = movieDetails?.overview
            let urlString = "https://image.tmdb.org/t/p/original"
            let posterPath = movieDetails?.posterPath ?? "error"
            guard let url = URL(string: urlString + posterPath) else {
                    return
                }
            self?.movieDetailPoster.af.setImage(withURL: url)
            }
        }, failure: { (error) in
            let alert = UIAlertController(title: "No results", message: "Check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }, id: movieId)
            
        
    
    
        starButton.setTitle("", for: .normal)
        watchedButton.setTitle("", for: .normal)
    }
    
}

