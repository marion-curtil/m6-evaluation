//
//  MasterViewController.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 30/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    // MARK: - Dependancies
    var viewModel: MasterViewModel?

    // MARK: - Properties
    weak var delegate: SelectionDelegate?
    var collapseDetailViewController = true
    private var userSelectedIndexPath: IndexPath?
    private var isSelectedCellByDefault: Bool {
        return userSelectedIndexPath == nil
    }
    private let defaultIndexPath = IndexPath(row: 0, section: 0)

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        splitViewController?.delegate = self

        tableView.register(UINib(nibName: "ImageTextCell", bundle: nil), forCellReuseIdentifier: "ImageTextCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        clearsSelectionOnViewWillAppear = true

        fetchData()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: { [weak self] _ in
            guard let indexPath = (self?.userSelectedIndexPath ?? self?.defaultIndexPath) else { return }

            self?.selectCellForSideBySidePresentation(with: indexPath)
            }, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if !selectCellForSideBySidePresentation(with: userSelectedIndexPath ?? defaultIndexPath) {
            userSelectedIndexPath = nil
        }
    }

    // MARK: - Table view delegate & datasource
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }

        userSelectedIndexPath = indexPath
        delegate?.selected(viewModel.dataSource[indexPath.section][indexPath.row])
        if let detailViewController = delegate as? DetailViewController, let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        userSelectedIndexPath = nil
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.dataSource.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataSource[section].count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTextCell", for: indexPath) as? ImageTextCell, let viewModel = viewModel else { return UITableViewCell() }
        
        cell.setup(with: viewModel.dataSource[indexPath.section][indexPath.row])

        return cell
    }

    // MARK: - Alert
    private func presentAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        alert.addAction(.init(title: "Retry", style: .default, handler: { [weak self] _ in
            self?.fetchData()
        }))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Private helpers
    private func fetchData() {
        viewModel?.getKanjis { [weak self] in
            if let errorMessage = self?.viewModel?.errorMessage {
                self?.presentAlert(with: errorMessage)
            } else {
                self?.tableView.reloadData()
                if let defaultIndexPath = self?.defaultIndexPath {
                    self?.selectCellForSideBySidePresentation(with: defaultIndexPath)
                }
            }
        }
    }

    @discardableResult private func selectCellForSideBySidePresentation(with indexPath: IndexPath) -> Bool {
        if splitViewController?.traitCollection.horizontalSizeClass == .regular,
            let viewModel = viewModel,
            !viewModel.dataSource.isEmpty {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
            tableView.cellForRow(at: indexPath)?.setSelected(true, animated: true)
            delegate?.selected(viewModel.dataSource[indexPath.section][indexPath.row])

            return true
        } else {
            return false
        }
    }
}

extension MasterViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if isSelectedCellByDefault {
            tableView.deselectRow(at: defaultIndexPath, animated: true)
            tableView.cellForRow(at: defaultIndexPath)?.setSelected(false, animated: false)
        }

        return isSelectedCellByDefault
    }
}
