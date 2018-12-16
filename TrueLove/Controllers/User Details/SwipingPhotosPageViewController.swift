//
//  SwipingPhotosPageViewController.swift
//  TrueLove
//
//  Created by Harry on 16/12/2018.
//  Copyright © 2018 Harry Ng. All rights reserved.
//

import UIKit

class SwipingPhotosPageViewController: UIPageViewController {
   
    let controllers = [
        PhotoController(image: #imageLiteral(resourceName: "KimMinHee1")),
        PhotoController(image: #imageLiteral(resourceName: "KimMinHee3")),
        PhotoController(image: #imageLiteral(resourceName: "1")),
        PhotoController(image: #imageLiteral(resourceName: "2")),
        PhotoController(image: #imageLiteral(resourceName: "KimMinHee2"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        view.backgroundColor = .yellow
        
        setViewControllers([controllers.first!], direction: .forward, animated: false)
    }

}

extension SwipingPhotosPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = self.controllers.firstIndex(where: {$0 == viewController}) ?? 0
        if index == 0 { return nil }
        return controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = self.controllers.firstIndex(where: {$0 == viewController}) ?? 0
        if index == controllers.count - 1 { return nil }
        return controllers[index + 1]
    }
}

class PhotoController: UIViewController {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "KimMinHee3"))
    
    init(image: UIImage) {
        imageView.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFit
    }
}
