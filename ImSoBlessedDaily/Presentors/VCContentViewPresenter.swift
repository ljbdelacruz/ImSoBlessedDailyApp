//
//  VCContentViewPresenter.swift
//  ImSoBlessedDaily
//
//  Created by Lainel John Dela Cruz on 17/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

protocol VCContentViewDelegate{
    func ReturnURLRequest(urlreq:URLRequest)
}
class VCContentViewPresenter:NSObject{
    var url:URL?;
    var delegate:VCContentViewDelegate?;
    func toURL(url:String){
        self.url=URL(string: url);
    }
    func ProcessURLRequest(){
        print("Processing url request");
        self.delegate?.ReturnURLRequest(urlreq: URLRequest(url: self.url!))
    }
}
