//
//  ContentViewController.swift
//  ImSoBlessedDaily
//
//  Created by Lainel John Dela Cruz on 17/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import WebKit

class ContentViewController: UIViewController {
    @IBOutlet weak var UIWebContentDisplay: UIView!
    weak var UIContentDisplayWK: WKWebView!
    var presenter:VCContentViewPresenter?=VCContentViewPresenter();
    override func viewDidLoad(){
        super.viewDidLoad()
        UIContentDisplayWK=self.presenter?.WebConfig(webContentViewDisplay: self.UIWebContentDisplay);
        UIContentDisplayWK.uiDelegate = self
        self.presenter?.delegate=self;
        self.UIContentDisplayWK.load(self.presenter!.ProcessURLRequest(url:self.presenter!.url!))
        self.UIWebContentDisplay.addSubview(UIContentDisplayWK);
    }
}
extension ContentViewController:WKUIDelegate{
}
extension ContentViewController:VCContentViewDelegate{
}
