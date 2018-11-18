//
//  PostInfo.swift
//  ImSoBlessedDaily
//
//  Created by Lainel John Dela Cruz on 17/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Firebase

class PostInfo{
    var id,title, description, source:String;
    init(){
        self.id="";
        self.title="";
        self.description="";
        self.source="";
    }
    convenience init(id:String, title:String, description:String, source:String){
        self.init()
        self.set(id: id, title: title, desc: description, source: source);
    }
    convenience init(key:String, ds:[String:Any]){
        self.init();
        self.set(id: key as! String, title: ds["title"] as! String, desc: "", source: ds["source"] as! String);
    }
    func set(id:String,title:String, desc:String, source:String){
        self.id=id;
        self.title=title;
        self.description=desc;
        self.source=source;
    }
    static func all(completionHandler: @escaping (PostInfo?, String?) -> ()){
        let db=Database.database().reference().child("ImBlessedDaily").child("posts");
        FirebaseCustom.RetrieveDataValue(db: db, completionHandler: {
            (ds) in
            guard let dict=ds!.value as! Dictionary<String, Any>? else{
                completionHandler(nil, "Cannot Fetch data please make sure you are connected to the internet")
                return
            }
            let temp=PostInfo(key: ds!.key, ds: dict);
            completionHandler(temp, nil);
            
            
        })
    }
    
}
