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
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        UIContentDisplayWK = WKWebView(frame: .zero, configuration: webConfiguration)
        UIContentDisplayWK.frame.size=self.UIWebContentDisplay.frame.size
        UIContentDisplayWK.uiDelegate = self
        self.presenter?.delegate=self;
        self.presenter?.ProcessURLRequest()
    }
}
extension ContentViewController:WKUIDelegate{
}
extension ContentViewController:VCContentViewDelegate{
    func ReturnURLRequest(urlreq:URLRequest){
        print("Return URL");
        self.UIContentDisplayWK.load(urlreq)
        self.UIWebContentDisplay.addSubview(UIContentDisplayWK);
    }
}
