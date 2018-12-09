//
//  HomeViewController.swift
//  TrueLove
//
//  Created by Harry on 12/11/2018.
//  Copyright © 2018 Harry Ng. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let buttonsStackView = HomeBottomControlStackView()
    
//    let cardViewModels: [CardViewModel] = {
//        let producers = [
//            User(name: "Kelly", age: 23, profession: "Music DJ", imageNames: ["1"]),
//            User(name: "Candy", age: 18, profession: "Accountant", imageNames: ["2"]),
//            Advetiser(title: "Burger", brandName: "McDonald's", posterPhotoName: "ads1"),
//            User(name: "Kim Min Hee", age: 22, profession: "Pianist", imageNames: ["KimMinHee1", "KimMinHee2", "KimMinHee3"])
//        ] as [ProduceCardViewModel]
//
//        let viewModels = producers.map { (producer) -> CardViewModel in
//            return producer.toCardViewModel()
//        }
//
//        return viewModels
//    }()
    
    var cardViewModels = [CardViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topStackView.settingsButton.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
        
        setupLayout()
        setupFirestoreUserCards()
        fetchUsersfromFirestore()
    }
    
    fileprivate func fetchUsersfromFirestore() {
        let query = Firestore.firestore().collection("users")
//        let query = Firestore.firestore().collection("users").whereField("age", isLessThan: 40).whereField("age", isGreaterThan: 17)
//        let query = Firestore.firestore().collection("users").whereField("friends", arrayContains: "Chris")
        query.getDocuments { (snapshot, err) in
            if let err = err {
                print(err)
                return
            }
            
            snapshot?.documents.forEach({ (documentSnapshot) in
                let userDictionary = documentSnapshot.data()
                let user = User(dictionary: userDictionary)
                self.cardViewModels.append(user.toCardViewModel())
            })
            
            self.setupFirestoreUserCards()
        }
    }
    
    @objc func handleSettings() {
        let vc = RegistrationViewController()
        present(vc, animated: true, completion: nil)
    }

    //MARK:- Fileprivate
    fileprivate func setupLayout() {
        view.backgroundColor = .white
        
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 8)
        overallStackView.bringSubviewToFront(cardsDeckView)
    }

    fileprivate func setupFirestoreUserCards() {
        cardViewModels.forEach { (cardViewModel) in
            let cardView = CardView(frame: .zero)
            cardView.cardViewModel = cardViewModel
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
//       users.forEach { (user) in
//            let cardView = CardView(frame: .zero)
//            cardView.imageView.image = UIImage(named: user.imageName)
//
//            let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
//            attributedText.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
//            attributedText.append(NSAttributedString(string: "\n\(user.profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
//            cardView.informationLabel.attributedText = attributedText
//
//            cardsDeckView.addSubview(cardView)
//            cardView.fillSuperview()
//        }
    }
    
}

