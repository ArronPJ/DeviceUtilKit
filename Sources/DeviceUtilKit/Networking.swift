//
//  Networking.swift
//  DeviceUtilKit
//
//  Created by arronpj on 2021/7/28.
//

import Foundation

extension DeviceUtil {

    
    /// Network Operation/API
    public class Networking {
        
        
        /// <#Description#>
        public class Manager {
            public init(){}
            private let session = URLSession.shared
            
            public enum NetworkResult<Value> {
                case success(Value)
                case failure(Error?)
            }
            
            public func loadData(from url: URL,
                                completionHandler: @escaping (NetworkResult<Data>) -> Void)
            {
                let task = session.dataTask(with: url) { data, response, error in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                task.resume()
            }
            
        }
    }
}
