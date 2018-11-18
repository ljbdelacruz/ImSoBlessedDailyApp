//
//  PostCellTableViewCell.swift
//  ImSoBlessedDaily
//
//  Created by Lainel John Dela Cruz on 17/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import WebKit

class PostCellTableViewCell: UITableViewCell {

    @IBOutlet weak var UITVDescription: UITextView!
    @IBOutlet weak var UIWKContent: WKWebView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
