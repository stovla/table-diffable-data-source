//
//  AlertService.swift
//  TestingNewAPI
//
//  Created by Vlastimir on 7/6/19.
//  Copyright © 2019 Vlastimir. All rights reserved.
//

import UIKit

class AlertService {
    func createUserAlert(completion: @escaping (String) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: "Create User", message: nil, preferredStyle: .alert)
        alert.addTextField {
            $0.placeholder = "Enter user's name"
        }
        let action = UIAlertAction(title: "Save", style: .default) { _ in
            let userName = alert.textFields?.first?.text ?? ""
            completion(userName)
        }
        alert.addAction(action)
        return alert
    }
}

extension AlertService {
    func createUserAlert(_ name: @escaping (_ name: String) -> Void) {
        
    }
}
