//
//  getEntries.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

struct GetEntries: Decodable {
    let status: Int
    let data : [[EntriesData]]?
    let error: String?
}

struct EntriesData: Decodable {
    let id: String?
    let body: String?
    let da: String?
    let dm: String?
}
