//
//  AddEntry.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/21/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

struct AddEntry: Decodable {
    let status: Int
    let data: IdEntry
    let error: String?
}

struct IdEntry: Decodable {
    let id: String
}
