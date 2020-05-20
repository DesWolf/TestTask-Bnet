//
//  JSONParameterEncoder.swift
//  TestTaskworkWorkWithAPI
//
//  Created by Максим Окунеев on 5/20/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

//import Foundation
//
//public struct JSONParameterEncoder: ParameterEncoder {
//    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
//        do {
////            print(parameters)
//            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: [])
//            urlRequest.httpBody = jsonAsData
//            print(urlRequest.httpBody?.last)
//            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
//                urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
//            }
//        }catch {
//            throw NetworkError.encodingFailed
//        }
//    }
//}
//    
