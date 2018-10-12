//
//  FieldNETRouter.swift
//  NewFieldNET
//
//  Created by Brandon Mantzey on 7/31/17.
//  Copyright © 2017 Lindsay Corporation. All rights reserved.
//

import Foundation
import Alamofire

public enum FieldNETRouter: URLRequestConvertible {
    static var authorization: String? = nil
    /// These ID's should only be those types that should appear in the "All Equipment" tab.
    static let allEquipmentTypeIds = [5, 30, 33, 36]
    
    case putConfigDat(directory: String, data: Data)
    
    var method: HTTPMethod {
        switch self {
        case .putConfigDat(_,_): return .put
        }
    }
    
    var path: String {
        switch self {
        case .putConfigDat(let folder): return "/\(folder)/CONFIG.DAT"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let parameters: Any = {
            switch self {
            case .putConfigDat(_, let data):
                return data
            default:
                return [:]
            }
        }()
        let headers: [String: Any] = {
            switch self {
            default:
                let headers = Dictionary<String, Any>()
                
                return headers
            }
        }()
        
        let url = URL(string: "http://172.25.63.1/myconnect/Files/HR09r/CONFIG.DAT")!

        var request = URLRequest(url: url)//.appendingPathComponent(path))

        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers as? [String: String]
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        var encodedURL: URLRequest!
        
        if let stringAnyParams = parameters as? [String: Any] {
            if method == .get {
                encodedURL = try URLEncoding.default.encode(request, with: stringAnyParams)
            } else if method == .post || method == .put {
                encodedURL = try JSONEncoding.default.encode(request, with: stringAnyParams)
            }
            // What if the method is not GET, POST, or PUT?
        } else if let stringAnyArrayParams = parameters as? [[String:Any]] {
            if let data = try? JSONSerialization.data(withJSONObject: stringAnyArrayParams, options: []) {
                request.httpBody = data
                encodedURL = try JSONEncoding.default.encode(request)
            }
        } else if let dataParams = parameters as? Data {
            request.httpBody = dataParams
            encodedURL = try JSONEncoding.default.encode(request)
        }
        // What if the type of the parameters is not [String: Any] or [[String: Any]]?
        
        return encodedURL
    }
}
