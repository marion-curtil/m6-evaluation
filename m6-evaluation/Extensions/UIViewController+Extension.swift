//
//  UIViewController+Extension.swift
//  m6-evaluation
//
//  Created by Marion Curtil on 05/08/2019.
//  Copyright © 2019 Zenika. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with message: String, retryAction: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        alert.addAction(.init(title: "Retry", style: .default, handler: { alertAction in
            retryAction(alertAction)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
