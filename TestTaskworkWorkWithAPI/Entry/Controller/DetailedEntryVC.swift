//
//  DetailedVC.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/21/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class DetailedEntryVC: UIViewController {

    @IBOutlet weak var bodyTF: UITextView!
    
    var entry: EntryData?
    var sesionKey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureScreen()
    }
    
    private func  configureScreen() {
        self.navigationItem.title = entry?.id ?? ""
        bodyTF.text = entry?.body ?? ""
    }
}
