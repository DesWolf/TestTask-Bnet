//
//  AddEntryVC.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/21/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class AddEntryVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    private let networkManagerData = NetworkManagerData()
    var sesionKey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonPress(_ sender: Any) {
        addEntries(sessionKey: sesionKey, body: textView.text ?? "")
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
        self.performSegue(withIdentifier: "addEntry", sender: self)
        }
    }
}

//MARK: Network
extension AddEntryVC {
     
    private func addEntries(sessionKey: String, body: String) {
        networkManagerData.addEntry(session: sessionKey, body: body) { [weak self] (id, error)  in
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
extension AddEntryVC {
    func alertNetwork(message: String) {
        UIAlertController.alert(title:"Error", msg:"\(message)", target: self)
    }
}
