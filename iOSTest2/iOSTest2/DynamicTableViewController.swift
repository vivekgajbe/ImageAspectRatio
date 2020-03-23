//
//  DynamicTableViewController.swift
//  iOSTest2
//
//  Created by vivek G on 22/03/20.
//  Copyright © 2020 vivek G. All rights reserved.
//

import UIKit

class DynamicTableViewController: UIViewController {
    
@IBOutlet weak var tableViewHome :UITableView!
    
    //var arrProfile = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","34","35","36"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewHome.estimatedRowHeight = 300
        tableViewHome.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }

}

// MARK: TableView datasource delegate
extension DynamicTableViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100//arrProfile.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        cell.selectionStyle = .none
        
        let image = UIImage(named:"img\(indexPath.row % 35)") // Indexpath.row % 35 - is used for repeating image array till 100 image
        cell.feedImageView.image = image
        
        var cellFrame = cell.frame.size
        cellFrame.height =  cellFrame.height - 15
        cellFrame.width =  cellFrame.width - 15
        cell.feedImageHeightConstraint.constant = image!.height(forWidth: cellFrame.width)
        cell.feedImageView.layer.cornerRadius = 12
        cell.feedImageView.layer.masksToBounds = true
        return cell
    }
}

class HomeTableViewCell : UITableViewCell
{
    @IBOutlet weak var feedImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var feedImageView: UIImageView!
}
