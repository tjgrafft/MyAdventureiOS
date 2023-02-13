//
//  ViewController.swift
//  MyAdventureiOS
//
//  Created by Taylor Grafft on 2/12/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    var adventurelogic = AdventureLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerSubmitted(_ sender: UIButton) {
        // get user response
        let userAnswer = sender.titleLabel!.text!
        
        let isCorrect = adventurelogic.compareUserResponse(userAnswer)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
            adventurelogic.increaseIndex()
            
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            sender.backgroundColor = UIColor.red
            adventurelogic.questionIndex = 0
            questionLabel.text = "Sorry you lost. Try again!"
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            return
        }
        
    }
    
    @objc func updateUI() {
        
        questionLabel.text = adventurelogic.getNextQuestion()
        buttonOne.setTitle(adventurelogic.getChoiceOne(), for: .normal)
        buttonTwo.setTitle(adventurelogic.getChoiceTwo(), for: .normal)
        
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
    }
}
