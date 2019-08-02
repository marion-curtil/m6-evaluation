//
//  URLSessionManager.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 01/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case missingData
}

class URLSessionManager: NSObject {
    static let shared = URLSessionManager()

    func fetch<T: Router, E: Codable>(_ router: T, completionHandler: @escaping (Result<E>) -> Void) {
        guard let request = router.urlRequest else { return completionHandler(.error(ApiError.invalidUrl)) }

        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                return completionHandler(.error(error))
            }
            guard let data = data else { return completionHandler(.error(ApiError.missingData)) }

            do {
                let data = try JSONDecoder().decode(E.self, from: data)
                return completionHandler(.success(data))
            } catch let error {
                return completionHandler(.error(error))
            }
        }.resume()
    }
}
