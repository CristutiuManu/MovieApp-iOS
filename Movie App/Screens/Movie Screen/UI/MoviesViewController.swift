//
//  MoviesViewController.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 27/10/2020.
//

import UIKit

class MoviesViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var moviesTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var movies = [Movie]()
    private var searchActive : Bool = false
    private let viewModel: MovieViewModel
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTable.keyboardDismissMode = .onDrag
        moviesTable.register(MoviesTableViewCell.nib(), forCellReuseIdentifier: MoviesTableViewCell.identifier)
        moviesTable.delegate = self
        moviesTable.rowHeight = 180
        moviesTable.dataSource = self
        navigationItem.hidesSearchBarWhenScrolling = true
        searchBar.delegate = self
        viewModel.getMoviesNetworking {[weak self] (movies) in
            self?.movies = movies
            self?.moviesTable.reloadData()
        } failure: { (error) in
            let alert = UIAlertController(title: "No results", message: "Check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        definesPresentationContext = true
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).clearButtonMode = .never
    }

    // MARK: - Table view data source

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as! MoviesTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = movies[indexPath.row].id
        viewModel.startDetailMovie(id: id)
    }
    
    // MARK: -Search Bar
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.navigationController?.navigationBar.isHidden = true
        var r = self.view.frame
        r.origin.y = -44
        r.size.height += 44
        searchActive = true;
        self.view.frame = r
        searchBar.setShowsCancelButton(true, animated: true)
    }

    private func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let keywords = searchBar.text
        let finalKeywords = keywords?.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let text = finalKeywords else {
            return
        }
        viewModel.getMoviesNetworkingBySearch(success: { (movies) in
            self.movies = movies
            self.moviesTable.reloadData()
        }, failure: { (error) in
            let alert = UIAlertController(title: "No results", message: "Check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }, text: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel.getMoviesNetworking { (movies) in
            self.movies = movies
            self.moviesTable.reloadData()
        } failure: { (error) in
            let alert = UIAlertController(title: "No results", message: "Check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            searchBar.endEditing(true)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.endEditing(true)
        }
    }
}
