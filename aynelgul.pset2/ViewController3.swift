//
//  ViewController3.swift
//  aynelgul.pset2
//
//  Created by Aynel Gül on 10-11-16.
//  Copyright © 2016 Aynel Gül. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    var userInput: String?
    var story: Story!
    
    @IBOutlet weak var newStory: UITextView!
    @IBOutlet weak var makeNew: UIButton!
    
    
    @IBAction func makeNewStory(_ sender: UIButton) {
        if makeNew.isSelected == true {
            story.clear()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newStory.text = userInput
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
