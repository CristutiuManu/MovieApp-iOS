//
//  HomeViewController.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 08/10/2020.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var genresButton: UIButton!
    @IBOutlet var actorsButton: UIButton!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Navigate to Genres
    
    @IBAction func genresButtonAction(_ sender: Any) {
        viewModel.startGenre()
    }
    
    //Navigate to Actors
    
    @IBAction func actorsActionButton(_ sender: Any) {
        viewModel.startActor()
    }
    
    //Navigate to Movies
    
    @IBAction func doneActionButton(_ sender: Any) {
        viewModel.startMovie()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Buttons design for genres and actors
        
        //genresButton.layer.cornerRadius = 24.0
        genresButton.clipsToBounds = true
        genresButton.backgroundColor = .blue
        
       // actorsButton.layer.cornerRadius = 24.0
        actorsButton.clipsToBounds = true
        actorsButton.backgroundColor = .blue
    }
}
