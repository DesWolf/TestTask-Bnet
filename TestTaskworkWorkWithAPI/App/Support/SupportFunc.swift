//
//  SupportFunc.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/21/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation


struct SupportFunc {
    
    func changeDate(str: String) -> String {
        let date = Date(timeIntervalSince1970: Double(str) ?? 1590080868)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM:HH:SS dd.MM.YYYY"
        let dateStr = dateFormatter.string(from: date)
        
        return dateStr
    }
}

extension String {
    func maxLength(length: Int) -> String {
        var str = self
        let nsString = str as NSString
        if nsString.length >= length {
            str = nsString.substring(with: NSRange( location: 0,
                                                    length: nsString.length > length ? length : nsString.length)
            )}
        return  "\(str)..."
    }
}
