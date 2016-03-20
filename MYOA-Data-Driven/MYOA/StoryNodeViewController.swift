//
//  StoryNodeViewController.swift
//  MYOA
//
//  Created by Jarrod Parkes on 11/2/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class StoryNodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var storyNode: StoryNode!
    
    @IBOutlet weak var adventureImageView: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restartButton: UIButton!
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the image
        if let imageName = storyNode.imageName {
            self.adventureImageView.image = UIImage(named: imageName)
        }
        
        // Set the message text
        self.messageTextView.text = storyNode.message
        
        // Hide the restart button if there are choices to be made
        restartButton.hidden = storyNode.promptCount() > 0
    }
    
        // MARK: - Table - Place Holder Implementation
    
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            // Implement to push the next story node. Use the same method used in RootTableViewController
            
            // Get the next storyNode at the selected index
            let nextNode = storyNode.storyNodeForIndex(indexPath.row)
            
            // Get a StoryNodeController from the Storyboard
            let nextStoryNodeController = self.storyboard!.instantiateViewControllerWithIdentifier("StoryNodeViewController")as! StoryNodeViewController
            
            // Set the story node to be the next node
            nextStoryNodeController.storyNode = nextNode
            
            // Push the new controller onto the stack
            self.navigationController!.pushViewController(nextStoryNodeController, animated: true)
    
    }
    
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Return the number of prompts in the storyNode
            return storyNode.promptCount()
        }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            // Dequeue a cell and populate it with text from the correct prompt.
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! 
    
            let prompt = storyNode.promptForIndex(indexPath.row)
            cell.textLabel!.text = prompt
            
            return cell
        }

    
    // MARK: - Actions
    
    @IBAction func restartStory() {
        let controller = self.navigationController!.viewControllers[1] 
        self.navigationController?.popToViewController(controller, animated: true)
    }
    
}