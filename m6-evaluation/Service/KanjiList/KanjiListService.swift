//
//  KanjiListService.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 31/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

class KanjiListService {
    func call(completionHandler: @escaping (Result<[KanjiListItem]>) -> Void) {
        let route = KanjiListRouter()
        URLSessionManager.shared.fetch(route, completionHandler: { (result: Result<[KanjiListItem]>) in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        })
    }
}
