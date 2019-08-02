//
//  ViewControllerProvider.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 30/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit

struct ViewControllerProvider {
    static var root: RootViewController {
        return RootViewController()
    }
    
    static var split: UISplitViewController {
        let splitViewController = UISplitViewController()
        splitViewController.preferredDisplayMode = .allVisible
        let masterNavigation = ViewControllerProvider.masterNavigation
        let detailNavigation = ViewControllerProvider.detailNavigation
        guard let master = masterNavigation.topViewController as? MasterViewController,
            let detail = detailNavigation.topViewController as? DetailViewController else { return splitViewController }
        master.delegate = detail
        splitViewController.viewControllers = [masterNavigation, detailNavigation]

        return splitViewController
    }

    static var masterNavigation: UINavigationController {
        let masterViewController = MasterViewController()
        let viewModel = MasterViewModel(kanjiService: KanjiService())
        masterViewController.viewModel = viewModel
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)

        return masterNavigationController
    }

    static var detailNavigation: UINavigationController {
        let detailViewController = DetailViewController()
        let detailNavigationController = UINavigationController(rootViewController: detailViewController)

        return detailNavigationController
    }
}
