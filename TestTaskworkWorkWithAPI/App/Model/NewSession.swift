//
//  NewSession.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

struct NewSession: Decodable {
    let status: Int
    let data : SessionData?
    let error: String?
}

struct SessionData: Decodable {
    let session: String?
}
