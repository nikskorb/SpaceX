//
//  MainPageViewController.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 25.03.2023.
//

import UIKit

final class MainPageViewController: UIPageViewController {
    private var rocketsViewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        rocketsViewControllers = [
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
        
        setViewControllers([rocketsViewControllers[0]], direction: .forward, animated: false)

    }
}

// MARK: - UIPageViewControllerDataSource


extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = rocketsViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else { return nil }
        return rocketsViewControllers[previousIndex]
//        guard let index = rocketsViewControllers.firstIndex(of: viewController) else { return nil }
//        return index == 0 ? rocketsViewControllers.last : rocketsViewControllers[index - 1]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = rocketsViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = currentIndex + 1
        guard nextIndex < rocketsViewControllers.count else { return nil }
        return rocketsViewControllers[nextIndex]
//        guard let index = rocketsViewControllers.firstIndex(of: viewController) else { return nil }
//        if viewController == rocketsViewControllers.last {
//            return rocketsViewControllers.first
//        } else {
//            return rocketsViewControllers[index + 1]
//        }
    }
    
    func presentationCount(for pageViewContreoller: UIPageViewController) -> Int {
        rocketsViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
}

extension MainPageViewController: UIPageViewControllerDelegate {
    
}
