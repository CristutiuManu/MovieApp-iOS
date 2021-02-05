//
//  GenresTableViewController.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 08/10/2020.
//

import UIKit

class GenreItem {
    var genre: Genre
    var isSelected: Bool
    var id: Int
    
    init(genre: Genre, isSelected: Bool, id: Int) {
        self.genre = genre
        self.isSelected = isSelected
        self.id = id
    }
}

class GenresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    private var genreItems = [GenreItem]()
    private let id: Int
    private let viewModel: GenreViewModel
    //private let genre = [Genre]()
    
    init(id: Int, viewModel: GenreViewModel) {
        self.id = id
        self.viewModel = viewModel
        super.init(nibName: "GenresViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        genreItems.forEach { (GenreItem) in
            //....
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(GenresTableViewCell.nib(), forCellReuseIdentifier: GenresTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
//        let service  = Service(baseUrl: "https://api.themoviedb.org/3/genre/movie/list?api_key=d773193a88ede0c03b5da21759b8dea6&language=")
//        service.getAllGenresByName(endPoint: "en-US")
//        service.completionHandlerGenres { [weak self] (genres, status, message) in
//            if status {
//                guard let self = self else {return}
//                guard let genres = genres else {return}
//                self.genreItems = genres.map({ (genre) -> GenreItem in
//                    //if favorite = get frosm saving.listoftype. favorite geners .conntains gener.id
//                    return GenreItem(genre: genre, isSelected: false, id: self.id)
//                })
//                self.table.reloadData()
//            }
//         }
        
        viewModel.getGenresNetworking {[weak self] (genres) in
            self?.genreItems = genres.map({ (genre) -> GenreItem in
                //if favorite = get frosm saving.listoftype. favorite geners .conntains gener.id
                return GenreItem(genre: genre, isSelected: false, id: self!.id)
            })
            self?.table.reloadData()

        } failure: { (error) in
            let alert = UIAlertController(title: "No results", message: "Check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenresTableViewCell.identifier, for: indexPath) as! GenresTableViewCell
        cell.configure(with: genreItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = genreItems[indexPath.row]
        item.isSelected.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        Saving.setButtonGenres(isSelected: item.isSelected, genreId: id)
    }
}
