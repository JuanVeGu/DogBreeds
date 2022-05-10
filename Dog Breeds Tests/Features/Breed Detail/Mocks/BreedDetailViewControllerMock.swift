//
//  BreedDetailViewControllerMock.swift
//  Dog Breeds Tests
//
//  Created by mobdev on 09-05-22.
//

import UIKit
@testable import Dog_Breeds

class BreedDetailViewControllerMock: BreedDetailViewController {
    var didCallPresentAlert = false
    
    override func presentAlert(title: String? = nil, message: String? = nil, actions: [UIAlertAction]? = nil, completionHandler: (() -> Void)? = nil) {
        didCallPresentAlert = true
        super.presentAlert(title: title, message: message, actions: actions, completionHandler: completionHandler)
    }
}
