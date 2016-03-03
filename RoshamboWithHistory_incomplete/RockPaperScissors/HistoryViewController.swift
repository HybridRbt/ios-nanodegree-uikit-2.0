//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Jianfeng Yang on 3/3/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    // Here is the history array which will hold the results of each match that is played in a session.
    var history = [RPSMatch]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("matchDetail")! as UITableViewCell
        
        var cellText = ""
        let user = self.history[indexPath.row].p1
        let pc = self.history[indexPath.row].p2
        
        if user.defeats(pc) {
            cellText = "WIN!"
            if let cellDetail = cell.detailTextLabel {
                cellDetail.text = "Your move: " + "\(user.description)" + ", their move: " + "\(pc.description)"
            }
        } else if pc.defeats(user) {
            cellText = "LOSE!"
            if let cellDetail = cell.detailTextLabel {
                cellDetail.text = "Your move: " + "\(user.description)" + ", their move: " + "\(pc.description)"
            }
        }
        
        cell.textLabel?.text = cellText
        
        return cell
    }
}
