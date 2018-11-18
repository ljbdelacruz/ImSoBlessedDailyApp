//
//  VCContentViewPresenter.swift
//  ImSoBlessedDaily
//
//  Created by Lainel John Dela Cruz on 17/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import WebKit

protocol VCContentViewDelegate{
}


class VCContentViewPresenter:NSObject{
    var url:String?;
    var delegate:VCContentViewDelegate?;
    func toURL(url:String)->URL{
        return URL(string:url)!;
    }
    func ProcessURLRequest(url:String)->URLRequest{
        return URLRequest(url: toURL(url: url));
    }
    func WebConfig(webContentViewDisplay:UIView)->WKWebView{
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        let UIContentDisplayWK = WKWebView(frame: .zero, configuration: webConfiguration)
        UIContentDisplayWK.frame.size=webContentViewDisplay.frame.size
        return UIContentDisplayWK;
    }
    
}
