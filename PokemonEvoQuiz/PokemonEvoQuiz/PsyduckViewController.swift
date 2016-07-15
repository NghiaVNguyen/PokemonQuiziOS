//
//  FirstQuizViewController.swift
//  PokemonEvoQuiz
//
//  Created by Nghia on 7/15/16.
//  Copyright © 2016 Nghia. All rights reserved.
//

import UIKit

class PsyduckViewController: UIViewController{
    
    @IBOutlet weak var pokemonIMG: UIImageView!
    var currentEvolution: String?
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var hidesSubmitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.hidden = true
        getPokemon()
        
        if let url = NSURL(string: "https://pokeapi.co/media/img/54.png") {
            if let data = NSData(contentsOfURL: url) {
                pokemonIMG.image = UIImage(data: data)
            }
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tryAgain: UILabel!
    
    @IBOutlet weak var userInput: UITextField!
    
    @IBAction func submitAnswer(sender: UIButton) {
        let someText = userInput.text
        print(someText)
        if someText != currentEvolution {
            self.tryAgain.text = "Sorry... try again!"
            print("wrong")
            
            let animationDuration = 0.25
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                self.tryAgain.alpha = 1
            }) { (Bool) -> Void in
                
                // After the animation completes, fade out the view after a delay
                UIView.animateWithDuration(animationDuration, delay: 1, options: .CurveEaseInOut, animations: { () -> Void in
                    self.tryAgain.alpha = 0
                    },
                                           completion: nil)
            }
        } else {
            print("correct")
            self.tryAgain.text = "Good Job! On to level 3!"
            hidesSubmitButton.hidden = true
            nextButton.hidden = false
            
            let animationDuration = 0.9
            
            
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                self.tryAgain.alpha = 1
            }) { (Bool) -> Void in
                
                // After the animation completes, fade out the view after a delay
                
                UIView.animateWithDuration(animationDuration, delay: 1, options: .CurveEaseInOut, animations: { () -> Void in
                    self.tryAgain.alpha = 0
                    },
                                           completion: nil)
            }
            
        }
        
        
    }
    
    func getPokemon() {
        let url = NSURL(string: "https://pokeapi.co/api/v2/evolution-chain/23")!
        let session = NSURLSession.sharedSession()
        print(url)
        
        let task = session.dataTaskWithURL(url, completionHandler: ({
            data, response, error in
            
            print("went thru")
            
            do {
                
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    
                    let species = jsonResult.valueForKeyPath("chain")!.valueForKeyPath("species")!.valueForKey("name") as! String
                    
                    
                    let evolutions = jsonResult.valueForKeyPath("chain")!.valueForKeyPath("evolves_to") as! NSArray
                    let evolution = evolutions[0].valueForKeyPath("species")!.valueForKey("name") as! String
                    self.currentEvolution = evolution
                    
                    
                    
                    
                }
                
            } catch {
                print("Failed to get JSON data")
            }
            
            
            
        }))
        task.resume()
    }
    
}