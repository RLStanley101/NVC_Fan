//
//  VideoModel.swift
//  NVC_Fan
//
//  Created by Ronnie Stanley on 12/19/16.
//  Copyright © 2016 Ronnie Stanley. All rights reserved.
//

import UIKit
import Alamofire


protocol VideoModelDelegate {
    func dataReady()
}



class VideoModel: NSObject {
    
    let API_KEY = "AIzaSyCU1k6TWJIiZGQ6g7xNCpe57h7Mi8SmWPA"
    let playlistId = "PLCNLR8pe7t6OZ02hiRGsAdgfyGUk3HWEw"
    
    var videoArray = [NVC]()
    var delegate: VideoModelDelegate?
    
    func getFeedVideos() {
        
        // Fetch the videos dynamically through YouTube API
        Alamofire.request("https://www.googleapis.com/youtube/v3/playlistItems", method: HTTPMethod.get, parameters: ["part": "snippet", "playlistId": playlistId, "maxResults":"50", "key": API_KEY], encoding: URLEncoding.default, headers: nil).responseJSON { (response) -> Void in
            
            var arrayOfVideos = [NVC]()
            
            if let JSON = response.result.value {
                for video in (JSON as! NSDictionary)["items"] as! NSArray {
                    
                    let videoObj = NVC()
                    videoObj.videoId = (video as! NSDictionary).value(forKeyPath: "snippet.resourceId.videoId") as! String
                    videoObj.videoTitle = (video as! NSDictionary).value(forKeyPath: "snippet.title") as! String
                    videoObj.videoDescription = (video as! NSDictionary).value(forKeyPath: "snippet.description") as! String
                    videoObj.imageUrl = (video as! NSDictionary).value(forKeyPath: "snippet.thumbnails.maxres.url") as! String
                    
                    arrayOfVideos.append(videoObj)
                }
                self.videoArray = arrayOfVideos
                
                // Notify the delegate thtat the data is ready
                if self.delegate != nil {
                    self.delegate!.dataReady()
                }
            }
        }
    }
}
