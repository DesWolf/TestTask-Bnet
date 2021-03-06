//
//  DetailedEntryTVCell.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/21/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class EntriesTVCell: UITableViewCell {
    
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var da: UILabel!
    @IBOutlet weak var dm: UILabel!
    @IBOutlet weak var modyfy: UILabel!
    
    private var supportFunc = SupportFunc()
    
    func configure( with entry: EntryData) {
        
        let dateCreate = supportFunc.changeDate(str: entry.da ?? "")
        let dateModify = supportFunc.changeDate(str: entry.dm ?? "")
        
        da.text = "\(dateCreate)"
        dm.text = dateCreate != dateModify ? "\(dateModify)" : ""
        modyfy.text = dateCreate != dateModify ? "Modify:" : ""
        body.text = entry.body?.maxLength(length: 200)
    }
}
