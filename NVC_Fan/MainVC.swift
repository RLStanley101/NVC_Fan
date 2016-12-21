//
//  ViewController.swift
//  NVC_Fan
//
//  Created by Ronnie Stanley on 12/18/16.
//  Copyright © 2016 Ronnie Stanley. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, VideoModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nvcs: [NVC] = [NVC]()
    
    let model: VideoModel = VideoModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model.delegate = self
        
        model.getFeedVideos()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


    // MARK: VideoModel Delegate Methods
    func dataReady() {
        // Access the video objects that have been downloaded
        self.nvcs = self.model.videoArray
        
        // Tell TableView to reload
        self.tableView.reloadData()
    }
    
    // MARK: TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nvcs.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let videos = sender as? NVC{
                destination.nvcVideo = videos
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nvcVideo = nvcs[indexPath.row]
        self.performSegue(withIdentifier: "VideoVC", sender: nvcVideo)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Video Cell")!
        let videoTitle = nvcs[indexPath.row].videoTitle
        
        // Get the label for the cell
        let label = cell.viewWithTag(2) as! UILabel
        label.text = videoTitle
        
        // Video image URL
        let videoThumbnailUrlString = nvcs[indexPath.row].imageUrl
        
        //create a NSURL object
        let videoThumbnail = NSURL(string: videoThumbnailUrlString)
        
        if videoThumbnail != nil {
            
            //create a NSUrlRequest object
            let request = NSURLRequest(url: videoThumbnail as! URL)
            
            //create a NSURLSession
            let session = URLSession.shared
            
            //create a datatask and pass it in the request
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                
                DispatchQueue.main.async {
                    //get the reference to the imageView of the cell
                    let imageview = cell.viewWithTag(3) as! UIImageView!
                    imageview?.image = UIImage(data : data!)
                    
                }
            })
            
            dataTask.resume()
            
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        }
}
