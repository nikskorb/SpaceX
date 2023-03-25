//
//  MainPageViewController.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 25.03.2023.
//

import UIKit

final class MainPageViewController: UIPageViewController {
    private var rocketViewControllers = [RocketViewController]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        rocketViewController = [
            {
                let vc = RocketViewController()
                vc.view.backgroundColor = .green
                return vc
            }(),
            {
                let vc = RocketViewController()
                vc.view.backgroundColor = .blue
                return vc
            }(),
            {
                let vc = RocketViewController()
                vc.view.backgroundColor = .brown
                return vc
            }()
        ]
        
        setViewControllers(rocketViewController, direction: .forward, animated: false)
    }
}

// MARK: - UIPageViewControllerDataSource


extension MainPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
    
}

// MARK: - UIPageViewControllerDataSource

extension MainPageViewController: UIPageViewControllerDataSource {
    
}
