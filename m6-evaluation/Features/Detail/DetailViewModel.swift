//
//  DetailViewModel.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 05/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

class DetailViewModel {
    // MARK: - Dependencies
    private let kanjiService: KanjiService
    private var item: ImageTextCellModel?

    // MARK: - Properties
    var errorMessage: String?

    init(kanjiService: KanjiService) {
        self.kanjiService = kanjiService
    }

    // MARK: - Public API
    func setup(with item: ImageTextCellModel) {
        self.item = item
    }

    func getKanji(onCompletion: @escaping (Kanji?) -> Void) {
        guard let item = item else {
            errorMessage = "There is no selected kanji"
            onCompletion(nil)

            return
        }
        kanjiService.call(forKanjiNamed: item.text, completionHandler: { [weak self] result in
            switch result {
            case let .success(kanji):
                self?.errorMessage = nil
                onCompletion(kanji)
            case .error:
                self?.errorMessage = "The detail could not be retrieved"
                onCompletion(nil)
            }
        })
    }
}
