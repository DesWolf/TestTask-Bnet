//
//  EndoPointType.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

protocol EndPointType {
    var scheme: String { get }
    var host : String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var queryItems: [String: String] { get }
}
