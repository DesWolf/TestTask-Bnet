//
//  DataEndpoint.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

public enum DataApi {
    case newSession(parameters: [String: String])
    case getEntries(parameters: [String: String])
    case addEntries(parameters: [String: String])
}

extension DataApi: EndPointType {
    
    var scheme: String {
        return "https"
    }
    var host: String {
        return "bnet.i-partner.ru"
    }
    
    var path: String {
        switch self {
        case .newSession(_):
            return "/testAPI/"
        case .getEntries(_):
            return "/testAPI/"
        case .addEntries(_):
            return "/testAPI/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .newSession(_):
            return .post
        case .getEntries(_):
            return .post
        case .addEntries(_):
            return .post
        }
    }
    
    var queryItems: [String: String] {
        switch self {
        case .newSession(let parameters):
            return parameters
        case .getEntries(let parameters):
            return parameters
        case .addEntries(let parameters):
            return parameters
        }
    }
}

