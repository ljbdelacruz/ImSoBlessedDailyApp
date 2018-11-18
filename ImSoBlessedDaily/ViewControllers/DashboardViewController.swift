//
//  DashboardViewController.swift
//  ImSoBlessedDaily
//
//  Created by Lainel John Dela Cruz on 17/11/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import WebKit

class DashboardViewController: UIViewController {
    var presenter:VCDashboardPresenter?;
    var contentPresenter:VCContentViewPresenter?;
    
    @IBOutlet weak var UIPostListTV: UITableView!
    override func viewDidLoad(){
        super.viewDidLoad()
        self.contentPresenter=VCContentViewPresenter();
        self.presenter=VCDashboardPresenter();
        self.presenter?.delegate=self;
        self.UIPostListTV.delegate=self;
        self.UIPostListTV.dataSource=self;
        self.UIPostListTV.register(UINib(nibName: "PostCellTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell");
        self.presenter?.LoadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dashboardToContent"{
            let destVC=segue.destination as! ContentViewController;
            destVC.presenter?.url=self.presenter!.selectedPost!.source;
        }
    }
    
}
extension DashboardViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter!.posts?.count ?? 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCellTableViewCell
        cell.UITVDescription.text=self.presenter!.posts![indexPath.row].title;
        let wkui=self.contentPresenter?.WebConfig(webContentViewDisplay: cell.UIWebViewDisplay);
        wkui?.uiDelegate=self;
        wkui?.load(self.contentPresenter!.ProcessURLRequest(url:self.presenter!.posts![indexPath.row].source))
        cell.UIWebViewDisplay.addSubview(wkui!);
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false);
        self.presenter?.selectedPost=self.presenter?.posts?[indexPath.row];
        performSegue(withIdentifier: "dashboardToContent", sender: nil)
    }
    
}
//MARK: VCDashboardDelegate func
extension DashboardViewController:VCDashboardDelegate{
    func CompleteLoadData(){
        print("COMPLETE DATA");
        self.UIPostListTV.reloadData()
    }
}
extension DashboardViewController:WKUIDelegate{
    
}
