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
    private var sessionKey = ""
    
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
            
            switch sessionKey.status {
            case 0:
                DispatchQueue.main.async {
                    self?.alertNetwork(message: sessionKey.error ?? "")
                }
            case 1:
                self?.sessionKey = sessionKey.data?.session ?? ""
            default:
                return
            }
        }
    }
    private func getEntries() {
        networkManagerData.getEntries(session: sessionKey) { [weak self] (entries, error)  in
            guard let entries = entries else {
                print(error ?? "")
                DispatchQueue.main.async {
                    self?.alertNetwork(message: error ?? "")
                }
                return
            }
            
            switch entries.status {
            case 0:
                DispatchQueue.main.async {
                    self?.alertNetwork(message: entries.error ?? "")
                }
            case 1:
                print(entries)
            default:
                return
            }
        }
    }
    
    private func addEntries() {
        networkManagerData.addEntry(session: sessionKey, body: "Test") { [weak self] (id, error)  in
            guard let id = id else {
                print(error ?? "")
                DispatchQueue.main.async {
                    self?.alertNetwork(message: error ?? "")
                }
                return
            }
            
            switch id.status {
            case 0:
                DispatchQueue.main.async {
                    self?.alertNetwork(message: id.error ?? "")
                }
            case 1:
                print(id.data.id)
            default:
                return
            }
        }
    }
}

//MARK: Alert
extension ViewController  {
    func alertNetwork(message: String) {
        UIAlertController.alert(title:"Error", msg:"\(message)", target: self)
    }
}
