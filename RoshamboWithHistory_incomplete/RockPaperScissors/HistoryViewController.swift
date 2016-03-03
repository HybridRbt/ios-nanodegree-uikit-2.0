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
        cell.textLabel?.text = self.history[indexPath.row].
        
        if let cell.detailTextLabel {
            
        }
    }
}
