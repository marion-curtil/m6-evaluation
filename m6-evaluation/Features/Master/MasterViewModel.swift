//
//  MasterViewModel.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 01/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

class MasterViewModel {
    // MARK: - Dependencies
    private let kanjiService: KanjiService

    // MARK: - Properties
    var dataSource: [[ImageTextCellModel]] = [] {
        didSet {
            if !dataSource.isEmpty {
                errorMessage = nil
            }
        }
    }
    var errorMessage: String?

    init(kanjiService: KanjiService) {
        self.kanjiService = kanjiService
    }

    // MARK: - Public API
    func getKanjis(onCompletion: @escaping () -> Void) {
        kanjiService.call(completionHandler: { [weak self] result in
            switch result {
            case let .success(kanjis):
                self?.dataSource = self?.prepareDataSource(kanjis: kanjis) ?? []
            case let .error(error):
                self?.errorMessage = self?.prepareError(error: error)
            }
            onCompletion()
        })
    }

    // MARK: - Datasource et error preparation
    private func prepareDataSource(kanjis: [Kanji]) -> [[ImageTextCellModel]] {
        let cellModels = kanjis.map { ImageTextCellModel(imageUrl: URL(string: $0.imageUrlString), text: $0.name) }

        return [cellModels]
    }

    private func prepareError(error: Error) -> String {
        guard let error = error as? ApiError else { return "An unknown error has occured" }

        switch error {
        case .invalidUrl:
            return "A technical error has occured"
        case .missingData:
            return "Sorry, no data is available at the moment"
        }
    }
}
