//
//  Webservices.swift
//  AnkitInterView
//
//  Created by Ankit Jaiswal on 13/09/17.
//  Copyright © 2017 CrownStack. All rights reserved.
//

import Foundation
import SwiftyJSON

enum WebServices {

    enum EndPoint : String {
        
        case baseUrl = "https://itunes.apple.com/"
        case searchUserSong = "search"

        var url: String {
            switch self {
            case .baseUrl:
                return self.rawValue
                
            default:
                print("\(EndPoint.baseUrl.rawValue)\(self.rawValue)")
                return "\(EndPoint.baseUrl.rawValue)\(self.rawValue)"
                
            }
        }
    }
}

extension NSError {

    convenience init(localizedDescription : String) {
        
        self.init(domain: "AppNetworkingError", code: 0, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
    
    convenience init(code : Int, localizedDescription : String) {
        
        self.init(domain: "AppNetworkingError", code: code, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
}

extension WebServices {

    static func searchSongsApi(_ parameters : JSONDictionary, success : @escaping ([AIMichaelSongsInfo]) -> Void, failure : @escaping (Error) -> Void) {
        
        // Configure Parameters and Headers
        
        AppNetworking.GET(EndPoint.searchUserSong.url, parameters: parameters, success: { json in
            
            let dashboards = AIMichaelSongsInfo.models(from: json["results"].arrayValue)
            success(dashboards)
            
            if dashboards.isEmpty {
                //showToastMessage(json["MESSAGE"].stringValue)
            }
            
            if ![200].contains(json["code"].intValue) || dashboards.isEmpty {
                let e = NSError(localizedDescription: json["message"].string ?? "Error! Please try again.")
                failure(e)
            }
            
        }, failure: {(e : Error) -> Void in
            
            // Handle respective error for login
            failure(e)
        })
        
    }
    
}
