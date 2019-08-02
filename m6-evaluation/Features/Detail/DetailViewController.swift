//
//  DetailViewController.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 31/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }

    func setup(with model: ImageTextCellModel) {
        if !isViewLoaded {
            loadView()
        }
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: model.imageUrl)
        label.isHidden = false
        label.text = model.text
    }
}

extension DetailViewController: SelectionDelegate {
    func selected(_ model: ImageTextCellModel) {
        setup(with: model)
    }
}
