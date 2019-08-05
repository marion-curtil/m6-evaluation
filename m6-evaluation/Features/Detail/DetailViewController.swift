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

    // MARK: - Dependancies
    var viewModel: DetailViewModel?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
    }

    // MARK: - Public API
    func setup(pronunciation: String, imageUrlString: String) {
        if !isViewLoaded {
            loadView()
        }
        imageView.isHidden = false
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: URL(string: imageUrlString))
        label.isHidden = false
        label.text = pronunciation
    }

    // MARK: - Private helpers
    private func fetchData() {
        viewModel?.getKanji(onCompletion: { [weak self] kanji in
            if let kanji = kanji {
                self?.setup(pronunciation: kanji.pronunciation, imageUrlString: kanji.imageUrlString)
            } else if let errorMessage = self?.viewModel?.errorMessage {
                self?.label.isHidden = true
                self?.imageView?.isHidden = true
                self?.presentAlert(with: errorMessage, retryAction: { _ in
                    self?.fetchData()
                })
            }
        })
    }
}

extension DetailViewController: SelectionDelegate {
    func selected(_ model: ImageTextCellModel) {
        viewModel?.setup(with: model)
        fetchData()
    }
}
