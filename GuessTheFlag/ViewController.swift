//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Shashwat Singh on 27/2/23.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var rounds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.9)
        
        countries += ["estonia","france","germany","ireland","italy", "monaco", "nigeria", "poland","russia", "spain", "uk","us"]
        
        //creating borders for flags using CALayer property borderWidth
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action : UIAlertAction! = nil){
        countries.shuffle()//shuffling the array and selecting first 3 elements
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = "Round :  \(rounds+1)\t\t"+countries[correctAnswer].uppercased()+"\t\t Score : \(score)"
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        rounds += 1
        
        var title : String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            
            if(rounds == 10){
                let ac = UIAlertController(title: title, message: "Final Score : \(score)", preferredStyle: .alert)
                
                rounds = 0
                
                ac.addAction(UIAlertAction(title: "Continue Another Game", style: .default, handler: askQuestion))
                
                present(ac, animated: true)
            }
            
            else{
                let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
                
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
                present(ac, animated: true)
               
            }
        }
        else{
            title = "Wrong"
            score -= 1
            
            if(rounds == 10){
                let ac = UIAlertController(title: title, message: "Wrong! That is the flag of \(countries[sender.tag].uppercased())\nFinal Score : \(score)", preferredStyle: .alert)
                
                rounds = 0
                
                ac.addAction(UIAlertAction(title: "Continue Another Game", style: .default, handler: askQuestion))
                
                present(ac, animated: true)
            }
            
            else{
                let ac = UIAlertController(title: title, message: "Wrong! That is the flag of \(countries[sender.tag].uppercased())\nYour score is \(score)", preferredStyle: .alert)
                
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
                present(ac, animated: true)
               
            }
        }
        
        
    }
    

}

