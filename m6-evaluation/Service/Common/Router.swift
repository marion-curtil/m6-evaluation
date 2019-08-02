//
//  Route.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 01/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Router {
    /// url for the current route
    var urlString: String { get }

    /// HTTP request method to be used for this router
    var method: RequestMethod { get }

    /// Sets up all necessary properties for current request.
    var urlRequest: URLRequest? { get }
}

extension Router {
    var urlRequest: URLRequest? {
        guard let url = URL(string: urlString) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        return request
    }
}
