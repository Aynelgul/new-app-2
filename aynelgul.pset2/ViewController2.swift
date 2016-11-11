//
//  ViewController2.swift
//  aynelgul.pset2
//
//  Created by Aynel Gül on 08-11-16.
//  Copyright © 2016 Aynel Gül. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var story: Story!
    
    @IBOutlet weak var getButtonOutput: UIButton!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var OK: UIButton!
    
    @IBAction func OKButton(_ sender: UIButton) {
        if userInput.text == "" {
            return
        }
        if story.isFilledIn() == false {
            story.fillInPlaceholder(word: userInput.text!)
            
            wordsLeft.text = String(story.getPlaceholderRemainingCount()) + " words left"

            userInput.text=""
            
            userInput.placeholder = story.getNextPlaceholder()
        }
        if story.getPlaceholderRemainingCount() == 0 {
            wordsLeft.text = "Done!"
            OK.isHidden = true
            getButtonOutput.isHidden = false
//            userInput.isHidden = true
        }
    }
    
    
    @IBOutlet weak var wordsLeft: UITextView!
    
    @IBAction func GETButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadStory()
        
        getButtonOutput.isHidden = true
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
        wordsLeft.text = String(story.getPlaceholderCount()) + " words left"
        
        userInput.placeholder = story.getNextPlaceholder()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /// Loads a story.
    func loadStory() {
        let randomNumber = arc4random_uniform(5) + 1
        if let dir = Bundle.main.path(forResource: String(randomNumber), ofType: "txt") {
            print(dir)
            do {
                let text = try String(contentsOf: URL(string: "file://\(dir)")!, encoding: String.Encoding.utf8)
                story = Story(stream: text)
            }
            catch {
                print(error)
            }
        }
            
    }
    
    // Function when tap is recognized.
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Give input to next view.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdVC = segue.destination as? ViewController3 {
            thirdVC.userInput = story.toString()
        }
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
