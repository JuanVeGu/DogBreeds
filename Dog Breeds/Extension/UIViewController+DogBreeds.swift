//
//  UIViewController+DogBreeds.swift
//  Dog Breeds
//
//  Created by mobdev on 27-04-22.
//

import UIKit

extension UIViewController {
    func presentAlert(
        title: String? = nil,
        message: String? = nil,
        actions: [UIAlertAction]? = nil,
        completionHandler: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title ?? "Alert", message: message, preferredStyle: .alert)
        
        if let actions = actions {
            actions.forEach { action in
                alert.addAction(action)
            }
        } else {
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                completionHandler?()
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}
