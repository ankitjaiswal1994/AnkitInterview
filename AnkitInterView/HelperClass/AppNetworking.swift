//
//  AppDelegate.swift
//  AnkitInterView
//
//  Created by Ankit Jaiswal on 13/09/17.
//  Copyright © 2017 CrownStack. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import AlamofireNetworkActivityIndicator

typealias JSONDictionary = [String: Any]
typealias JSONDictionaryArray = [JSONDictionary]



class AppNetworking {
    
    static func GET(_ endPoint : String,
                    parameters : JSONDictionary = [:],
                    headers : JSONDictionary = [:],
                    loader : Bool = true,
                    success : @escaping (JSON) -> Void,
                    failure : @escaping (Error) -> Void) {
        
        request(endPoint, httpMethod: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers, loader: loader, success: success, failure: failure)
    }
    
    
    fileprivate static func request(_ URLString : String,
                                httpMethod : HTTPMethod,
                                parameters : JSONDictionary = [:],
                                images: [String: UIImage?]? = nil,
                                encoding: URLEncoding = .httpBody,
                                headers : JSONDictionary = [:],
                                loader : Bool = true,
                                success : @escaping (JSON) -> Void,
                                failure : @escaping (Error) -> Void) {
        
        
        if loader { showLoader() }
        
        Alamofire.request(URLString, method: httpMethod,
                          parameters: parameters,
                          encoding: encoding,
                          headers: headers as? HTTPHeaders).responseJSON { (response:DataResponse<Any>) in
                                        
                            if loader { hideLoader() }
                            
                            parseResponse(response, success: success, failure: failure)
        }
    }
    
    fileprivate static func parseResponse(_ response: DataResponse<Any>,
                                      success : @escaping (JSON) -> Void,
                                      failure : @escaping (Error) -> Void) {
        
        switch(response.result) {
            
        case .success(let value):
            
            print(value)
            
            success(JSON(value))
            
        case .failure(let e):
            
            print(String(data: response.data!, encoding: String.Encoding.utf8) as Any)
            
            let err = (e as NSError)
            
            if err.code == NSURLErrorNotConnectedToInternet || err.code == NSURLErrorInternationalRoamingOff {
                
                // Handle Internet Not available UI
                let internetNotAvailableError = NSError(domain: "No Internet Connection Available", code: NSURLErrorNotConnectedToInternet)
                failure(internetNotAvailableError)
                
            } else {
                failure(e)
            }
        }
        
    }
}

extension AppNetworking {
    
    static func showLoader() {
        print("Ankit")
        NetworkActivityIndicatorManager.shared.isEnabled = true
    }
    
    static func hideLoader() {
        NetworkActivityIndicatorManager.shared.isEnabled = false
    }
}
