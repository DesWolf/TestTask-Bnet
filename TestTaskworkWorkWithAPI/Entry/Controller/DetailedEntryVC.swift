//
//  DetailedVC.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/21/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class DetailedEntryVC: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var daLabel: UILabel!
    @IBOutlet weak var dmLabel: UILabel!
    
    var entry: EntryData?
    var sesionKey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureScreen()
    }
    
    private func  configureScreen() {
        idLabel.text = "id: \(entry?.id ?? "")"
        bodyLabel.text = "Body: \(entry?.body ?? "")"
        daLabel.text = "da: \(entry?.da ?? "")"
        dmLabel.text = entry?.da != entry?.dm ? "dm: \(entry?.dm ?? "")" : ""
    }
}
