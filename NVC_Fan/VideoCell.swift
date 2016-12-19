//
//  VideoCell.swift
//  NVC_Fan
//
//  Created by Ronnie Stanley on 12/18/16.
//  Copyright © 2016 Ronnie Stanley. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(nvc: NVC) {
        videoTitle.text = nvc.videoTitle
        
        // TODO: add video image url
        
    }


}
