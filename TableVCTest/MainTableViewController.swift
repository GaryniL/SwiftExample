//
//  MainTableViewController.swift
//  TableVCTest
//
//  Created by Gary on 2017/9/14.
//  Copyright © 2017年 Gary. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    private var myTableView: UITableView!
    
    private let sections: NSArray = ["Section 1", "Section 2"]
    private let applePhone: NSArray = ["iPhone 6", "iPhone 6s", "iPhone 7", "iPhone 8", "iPhone X"]
    private let samsungPhone: NSArray = ["Note 7", "Note 8", "S8", "S8+"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Auto-set the UITableViewCells height (requires iOS8+)
        
        // get width and height of View
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Init TableView
        //
        //
        
        myTableView = UITableView()
//        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight)
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")         // register cell name
        
        
        // Autolayout
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myTableView)
        
        let horConstraint = NSLayoutConstraint(item: myTableView, attribute: .centerX, relatedBy: .equal,
                                               toItem: self.view, attribute: .centerX,
                                               multiplier: 1.0, constant: 0.0)
        let verConstraint = NSLayoutConstraint(item: myTableView, attribute: .centerY, relatedBy: .equal,
                                               toItem: self.view, attribute: .centerY,
                                               multiplier: 1.0, constant: 0.0)
        let widConstraint = NSLayoutConstraint(item: myTableView, attribute: .width, relatedBy: .equal,
                                               toItem: self.view, attribute: .width,
                                               multiplier: 1.0, constant: 0.0)
        let heiConstraint = NSLayoutConstraint(item: myTableView, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height,
                                               multiplier: 1.0, constant: 0.0)
        view.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //Auto-set the UITableViewCells height (requires iOS8+)
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 44
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Cell
    //
    //
    
    // return the number of cells each section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return applePhone.count
        } else if section == 1 {
            return samsungPhone.count
        } else {
            return 0
        }
    }
    
    
    // return cells
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        if indexPath.section == 0 {
            cell.labelOne.text = "\(applePhone[indexPath.row])"
            cell.labelTwo.text = "Message \(indexPath.row)"
            cell.labelThree.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .short)
        }
        else if indexPath.section == 1 {
            cell.labelOne.text = "\(samsungPhone[indexPath.row])"
            cell.labelTwo.text = "Message \(indexPath.row)"
            cell.labelThree.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .short)
        }
        return cell
    }
    
    // Session
    //
    //
    
    // return the number of sections
    func numberOfSections(in tableView: UITableView) -> Int{
        return sections.count
    }
    
    // return the title of sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section] as? String
    }
    
    
}
