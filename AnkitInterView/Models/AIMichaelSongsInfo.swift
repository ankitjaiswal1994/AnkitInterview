//
//  AIMichaelSongsInfo.swift
//  AnkitInterView
//
//  Created by Ankit Jaiswal on 13/09/17.
//  Copyright © 2017 CrownStack. All rights reserved.
//

import SwiftyJSON

class AIMichaelSongsInfo {
    
    let artistName: String
    let trackName: String
    let collectionCensoredName: String
    let trackCensoredName: String
    let artworkUrl100: String
    let collectionPrice: String
    let trackPrice: String
    var releaseDate: String
    let discCount: String
    let discNumber: String
    let trackCount: String

    required init?(json: JSON) {
        
        artistName                  = json["artistName"].stringValue
        trackName                   = json["trackName"].stringValue
        collectionCensoredName      = json["collectionCensoredName"].stringValue
        trackCensoredName           = json["trackCensoredName"].stringValue
        artworkUrl100               = json["artworkUrl100"].stringValue
        collectionPrice             = json["collectionPrice"].stringValue
        trackPrice                  = json["trackPrice"].stringValue
        releaseDate                 = json["releaseDate"].stringValue
        discCount                   = json["discCount"].stringValue
        discNumber                  = json["discNumber"].stringValue
        trackCount                  = json["trackCount"].stringValue
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: releaseDate)!
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        releaseDate = dateFormatter.string(from: date)
    }
    
    class func models(from jsonArray: [JSON]) -> [AIMichaelSongsInfo] {
        var models: [AIMichaelSongsInfo] = []
        for json in jsonArray {
            if let task = AIMichaelSongsInfo(json: json) {
                models.append(task)
            }
        }
        return models
    }
    
}
