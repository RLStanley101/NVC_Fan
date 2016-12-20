//
//  NVCModel.swift
//  NVC_Fan
//
//  Created by Ronnie Stanley on 12/18/16.
//  Copyright © 2016 Ronnie Stanley. All rights reserved.
//

import Foundation

class NVC {
    private var _imageURL: String!
    private var _videoID: String!
    private var _videoTitle: String!
    private var _videoDescription: String!
    
    var imageURL: String {
        return _imageURL
    }
    var videoID: String {
        return _videoID
    }
    var videoTitle: String {
        return _videoTitle
    }
    var videoDescription: String {
        return _videoDescription
    }
    
    init(imageURL: String, videoID: String, videoTitle: String, videoDescription: String) {
        _imageURL = imageURL
        _videoID = videoID
        _videoTitle = videoTitle
        _videoDescription = videoDescription
    }
}

