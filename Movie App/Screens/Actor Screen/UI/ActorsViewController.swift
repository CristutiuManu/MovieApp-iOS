//
//  ActorsTableViewController.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 08/10/2020.
//

import UIKit

class ActorsViewController:  UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var actorsTable: UITableView!
    @IBOutlet weak var searchField: UISearchBar!
    private var actors = [Actor]()
    private var searchActive : Bool = false
    let actorViewModel: ActorViewModel
    
    init(viewModel: ActorViewModel) {
        self.actorViewModel = viewModel
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
        actorsTable.keyboardDismissMode = .onDrag
        actorsTable.register(ActorsTableViewCell.nib(), forCellReuseIdentifier: ActorsTableViewCell.identifier)
        actorsTable.delegate = self
        actorsTable.dataSource = self
        actorsTable.rowHeight = 180
        navigationItem.hidesSearchBarWhenScrolling = true
        searchField.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        actorViewModel.getActorsNetworking (success: { [weak self] (actors) in
            DispatchQueue.main.async {
                self?.actors = actors
                self?.actorsTable.reloadData()
            }
        }, failure: { (error) in
            let alert = UIAlertController(title: "No actors", message: "Check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
        definesPresentationContext = true
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).clearButtonMode = .never
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActorsTableViewCell.identifier, for: indexPath) as! ActorsTableViewCell
        cell.configure(with: actors[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = actors[indexPath.row].id
        actorViewModel.startDetailActor(id: id)
    }
    
    // MARK: Search Bar
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let keywords = searchField.text
        let finalKeywords = keywords?.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let text = finalKeywords else {
            return
        }
        actorViewModel.getActorsNetworkingBySearch(success: {[weak self] (actors) in
            DispatchQueue.main.async {
                self?.actors = actors
                self?.actorsTable.reloadData()
            }
        }, failure: {(error) in
            let alert = UIAlertController(title: "No results", message: "Check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }, text: text )
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        actorViewModel.getActorsNetworking { [weak self] (actors) in
            DispatchQueue.main.async {
                self?.actors = actors
                self?.actorsTable.reloadData()
            }
        } failure: { (error) in
            let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            searchField.endEditing(true)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchField.endEditing(true)
        }
    }
}

// MARK: Extensions
extension ActorsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}

extension ActorsViewController: UISearchBarDelegate {
}
