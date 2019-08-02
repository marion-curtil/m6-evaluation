//
//  KanjiService.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 31/07/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

class KanjiService {
    func call(completionHandler: @escaping (Result<[Kanji]>) -> Void) {
        let route = KanjiRouter()
        URLSessionManager.shared.fetch(route, completionHandler: { (result: Result<[Kanji]>) in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        })
    }
}
