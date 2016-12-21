//
//  VideoVC.swift
//  NVC_Fan
//
//  Created by Ronnie Stanley on 12/18/16.
//  Copyright © 2016 Ronnie Stanley. All rights reserved.
//

import UIKit
import WebKit

class VideoVC: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var TitleLabel: UINavigationItem!
    @IBOutlet weak var webView: UIWebView!
    
    var nvcVideo: NVC!
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
        let url = NSURL(string: "https://www.youtube.com/watch?v=\(nvcVideo.videoId)")
        let requestObj = NSURLRequest(url: url! as URL);
        
        webView.loadRequest(requestObj as URLRequest)
        webView.scrollView.isScrollEnabled = false

    }
    
    @IBAction func backBtnTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    

    
}
