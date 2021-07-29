//
//  Networking.swift
//  DeviceUtilKit
//
//  Created by arronpj on 2021/7/28.
//

import Foundation

public protocol NetworkSession {

    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void )
}

extension URLSession : NetworkSession{
    
    public func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url){ data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }
}

extension DeviceUtil {

    
    /// Network Operation/API
    public class Networking {
        
        
        /// <#Description#>
        public class Manager {
            public init(){}
            internal var session : NetworkSession = URLSession.shared
            
            public enum NetworkResult<Value> {
                case success(Value)
                case failure(Error?)
            }
            
            /// Calls to the live internet to retrieve Data from URL
            /// - Parameters:
            ///   - url: the location of target data retrieve
            ///   - completionHandler: Return result object with status
            public func loadData(from url: URL,
                                completionHandler: @escaping (NetworkResult<Data>) -> Void)
            {
                session.get(from: url) { data, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
            }
            
        }
    }
}
