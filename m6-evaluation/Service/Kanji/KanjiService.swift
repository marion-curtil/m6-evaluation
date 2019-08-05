//
//  KanjiService.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 05/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

class KanjiService {
    func call(forKanjiNamed name: String, completionHandler: @escaping (Result<Kanji>) -> Void) {
        let route = KanjiRouter(name: name)
        URLSessionManager.shared.fetch(route, completionHandler: { (result: Result<Kanji>) in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        })
    }
}
