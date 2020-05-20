//
//  DataEndpoint.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum DataApi {
    case newSession(parameters: [String: String])

}

extension DataApi: EndPointType {

    var scheme: String {
        return "https"
    }
    var host: String {
       return "bnet.i-partner.ru"
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .newSession(_):
            return "/testAPI/"

        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var queryItems: [String: String] {
        switch self {
        case .newSession(let parameters):
            return parameters
        }
    }
}

