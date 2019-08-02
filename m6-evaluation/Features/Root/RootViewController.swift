//
//  SplitViewController.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 30/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Properties
    lazy var split: UISplitViewController = {
        return ViewControllerProvider.split
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        add(childController: split)
    }

    override func viewDidAppear(_ animated: Bool) {
        configureSplitViewLayout()

        super.viewDidAppear(false)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        configureSplitViewLayout()

        super.viewWillTransition(to: size, with: coordinator)
    }

    // MARK: - Private helpers
    private func add(childController controller: UIViewController) {
        view.addSubview(controller.view)
        controller.view.frame = view.bounds
        addChild(controller)
        controller.didMove(toParent: self)
    }

    private func configureSplitViewLayout() {
        let forcedTraitCollection = UIDevice.isIpadPortrait ? UITraitCollection(traitsFrom: [UITraitCollection(horizontalSizeClass: .compact), UITraitCollection(verticalSizeClass: .regular)]) : nil
        setOverrideTraitCollection(forcedTraitCollection, forChild: split)
    }
}
