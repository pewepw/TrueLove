//
//  HomeViewController.swift
//  TrueLove
//
//  Created by Harry on 12/11/2018.
//  Copyright © 2018 Harry Ng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let buttonsStackView = HomeBottomControlStackView()
    
    let users = [
        User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "1"),
        User(name: "Candy", age: 18, profession: "Accountant", imageName: "2"),
        User(name: "Carmen", age: 22, profession: "Pianist", imageName: "3")
    ]
    
    let cardViewModels = [
        User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "1").toCardViewModel(),
        User(name: "Candy", age: 18, profession: "Accountant", imageName: "2").toCardViewModel(),
        User(name: "Carmen", age: 22, profession: "Pianist", imageName: "3").toCardViewModel()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupDummyCards()
        
    }

    //MARK:- Fileprivate
    
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 8)
        overallStackView.bringSubviewToFront(cardsDeckView)
    }

    fileprivate func setupDummyCards() {
        cardViewModels.forEach { (cardViewModel) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: cardViewModel.imageName)
            cardView.informationLabel.attributedText = cardViewModel.attributedString
            cardView.informationLabel.textAlignment = cardViewModel.textAlignment
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

