//
//  VCDashboardPresenter.swift
//  ImSoBlessedDaily
//
//  Created by Lainel John Dela Cruz on 17/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

protocol VCDashboardDelegate {
    func CompleteLoadData()
}

extension VCDashboardDelegate{
}
class VCDashboardPresenter:NSObject{
    var posts:[PostInfo]?=[]
    var selectedPost:PostInfo?;
    var delegate:VCDashboardDelegate?;
    func LoadData(){
        PostInfo.all(completionHandler: {
            (data, err) in
            if err == nil {
                self.posts?.append(data!);
                self.delegate!.CompleteLoadData();
            }
        })
    }
}
