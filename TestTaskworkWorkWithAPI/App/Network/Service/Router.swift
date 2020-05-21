//
//  Router.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        guard let url = setComponents(from: route).url else { return }
        var request = URLRequest(url: url)
        
        if let query = url.query {
            request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.addValue(NetworkManagerData.bnetAPIKey, forHTTPHeaderField: "token")
            request.httpMethod = route.httpMethod.rawValue
            request.httpBody = query.data(using: .utf8)
        }
        NetworkLogger.log(request: request)
        task = session.dataTask(with: request, completionHandler: { data, response, error in
            completion(data, response, error)
        })
        
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    private func setComponents(from route: EndPoint) -> URLComponents {
        var components = URLComponents()
        components.scheme = route.scheme
        components.host = route.host
        components.path = route.path
        components.queryItems = route.queryItems.map { URLQueryItem(name: $0, value: $1) }
        
        return components
    }
}
