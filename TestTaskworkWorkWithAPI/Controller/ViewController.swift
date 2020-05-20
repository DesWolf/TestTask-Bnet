//
//  ViewController.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let networkManagerData = NetworkManagerData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newSession()
    }
}

//MARK: Network
extension ViewController {
    private func newSession() {
        networkManagerData.newSession() { [weak self] (sessionKey, error)  in
            guard let sessionKey = sessionKey else {
                print(error ?? "")
                DispatchQueue.main.async {
                    self?.alertNetwork(message: error ?? "")
                }
                return
            }
            print(sessionKey)
        }
    }
}

//MARK: Alert
extension ViewController  {
    func alertNetwork(message: String) {
        UIAlertController.alert(title:"Error", msg:"\(message)", target: self)
    }
}
