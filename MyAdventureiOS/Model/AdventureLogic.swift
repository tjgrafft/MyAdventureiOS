//
//  AdventureLogic.swift
//  MyAdventureiOS
//
//  Created by Taylor Grafft on 2/12/23.
//

import Foundation

struct AdventureLogic {
    
    var questionIndex : Int = 0
    
    let question = [
                Question("You enter a room with two doors and a butler hands you a rusty key. Which door do you choose to open?",
                         "Door One",
                         "Door Two",
                         "Door One"),
                Question("You've successfully made it to the next room. A second butler offers you money or love. Which do you choose?",
                         "Money",
                         "Love",
                         "Love"),
                Question("Good choice. A third butler approaches and offers you a choice between two boxes. One is gold. The other is wood. Which do you choose?",
                         "Gold Box",
                         "Wood Box",
                         "Wood Box"),
                Question("You successfully completed the adventure! Now choose Reset to start over",
                         "Reset",
                         "",
                         "Reset")
            ]
    
    mutating func compareUserResponse(_ response: String) -> Bool {
        if response == question[questionIndex].answer {
            return true
        } else {
            return false
        }
    }
    
    mutating func increaseIndex() {
        if questionIndex < question.count-1 {
            questionIndex += 1
        } else {
            questionIndex = 0
        }
    }
    
    func getNextQuestion() -> String {
        return question[questionIndex].question
    }
    
    func getChoiceOne() -> String {
        return question[questionIndex].option_one
    }
    
    func getChoiceTwo() -> String {
        return question[questionIndex].option_two
    }
    
    
}
