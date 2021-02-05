//
//  ActorDetailsViewController.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 19/10/2020.
//

import UIKit

class ActorDetailsViewController: UIViewController {
    private var defaults = UserDefaults.standard
    @IBOutlet private weak var imageActor: UIImageView!
    @IBOutlet private weak var actorName: UILabel!
    @IBOutlet private weak var actorBirthday: UILabel!
    @IBOutlet private weak var actorDescription: UILabel!
    @IBOutlet private weak var selectedButton: UIButton!
    private let id: Int
    private var actorsDetails: ActorDetails?
    private var select = "select"
    private var viewModel: DetailActorViewModel
    
    init(id: Int, viewModel: DetailActorViewModel) {
        self.id = id
        self.viewModel = viewModel
        actorsDetails = ActorDetails()
        super.init(nibName: "ActorDetailsViewController", bundle: nil)
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
        let personId = id
        selectedButton.setImage(UIImage(named: "Unchecked"), for: .normal)
        selectedButton.setImage(UIImage(named: "Checked"), for: .selected)
        self.selectedButton.setTitle( "Selected", for: .selected)
        self.selectedButton.setTitle("Select", for: .normal)
        viewModel.getActorDetailsNetworking(success: {[weak self] (actorDetails) in
            self?.actorsDetails = actorDetails
            DispatchQueue.main.async {
                self?.actorName.text = actorDetails?.name
                self?.actorBirthday.text = actorDetails?.birthday
                
                self?.actorDescription.text = actorDetails?.biography
                let urlString = "https://image.tmdb.org/t/p/original"
                let profilePath = actorDetails?.profilePath ?? "error"
                guard let url = URL(string: urlString + profilePath) else {
                    return
                }
                self?.imageActor.af.setImage(withURL: url)
                //Saving data
                if Saving.getButtonActorsValue(actorId: self!.id ) {
                    self?.selectedButton.isSelected = true
                } else {
                    self?.selectedButton.isSelected = false
                }
            }
            
        }, failure: { (error) in
            let alert = UIAlertController(title: "No results", message: "Check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }, id: personId)
        
//        let service = Service(baseUrl:
//                                "https://api.themoviedb.org/3/person/\(personId)?api_key=d773193a88ede0c03b5da21759b8dea6&language=en-US")
//        service.getActorDetails(endPoint: "")
//        service.callBackDetailsActor = { actorDetails ,status ,message in
//            self.actorsDetails = actorDetails
//
//
//
//        }
    }
    
    @IBAction private func selectButton(_ sender: UIButton) {
        
        selectedButton.isSelected.toggle()
        Saving.setButtonActors(isSelected: sender.isSelected, actorId: id)
    }
    
}

