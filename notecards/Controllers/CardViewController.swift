//
//  CardViewController.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/20/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var cardTextLabel: UILabel!
    @IBOutlet weak var flipCardBtn: UIButton!
    @IBOutlet weak var cardCountLabel: UILabel!
    
    // MARK: - Variables
    
    var cards: [Card] = []
    var questions: [Card] = []
    var questionsIndex = 0
    var testType: String = ""
    var service: String = ""
    var frontOfCard: Bool = true
    var correctAnswersArray: [String] = []
    var finalString = ""
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getServices()
    }
    
    // MARK: - Class methods
    
    func getServices() {
        if testType != "api" && service.isEmpty {
            cards.forEach { card in
                if card.tests.contains(testType) {
                    questions.append(card)
                }
            }
        } else if testType == "api" {
            cards.forEach { card in
                if card.type == "api" || card.type == "question" {
                    questions.append(card)
                }
            }
        } else if testType.isEmpty {
            if service != "" {
                cards.forEach { card in
                    if card.services.contains(service) {
                        questions.append(card)
                    }
                }
            }
        }
        
        updateCount()
        setup()
    }
    
    private func updateCount() {
        cardCountLabel.text = "Card \(questionsIndex + 1) of \(questions.count)"
    }
    
    private func setup() {
        cardTextLabel.text = questions[questionsIndex].frontOfCard
        
        if questions[questionsIndex].type == "question" {
            flipCardBtn.setTitle("See Answer", for: .normal)
        } else {
            flipCardBtn.setTitle("Flip Card", for: .normal)
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func flipCardBtnTapped(_ sender: Any) {
        if questionsIndex < questions.count {
            if frontOfCard {
                if questions[questionsIndex].type == "question" {
                    if questions[questionsIndex].answerType == "single" {
                        let strNumber: NSString = finalString as NSString
                        let attribute = NSMutableAttributedString.init(string: strNumber as String)
                        
                        let range = (strNumber).range(of: correctAnswersArray[0])
                        
                        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green , range: range)
                        cardTextLabel.attributedText = attribute
                    } else {
                        let strNumber: NSString = finalString as NSString
                        let attribute = NSMutableAttributedString.init(string: strNumber as String)
                        
                        for (index, _) in correctAnswersArray.enumerated() {
                            let range = (strNumber).range(of: correctAnswersArray[index])
                            attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green , range: range)
                        }
                        
                        cardTextLabel.attributedText = attribute
                    }
                } else {
                    let backOfCard = questions[questionsIndex].backOfCard
                    let backOfCardArray = backOfCard?.components(separatedBy: "_")
                    var formattedAnswer = ""
                    
                    backOfCardArray?.forEach { answer in
                        var ans = answer.replacingOccurrences(of: "_", with: "")
                        
                        // Handle the sublines
                        let charset = CharacterSet(charactersIn: "-")
                        var formattedSubLines = "\n"
                        if ans.rangeOfCharacter(from: charset) != nil {
                            print("Found sublines")
                            let subLines = ans.components(separatedBy: "-")
                            
                            for (index, subLine) in subLines.enumerated() {
                                if index != 0 {
                                    formattedSubLines = formattedSubLines + "  -\(subLine)\n"
                                }
                            }
                            
                            if let range = ans.range(of: "-") {
                                ans.removeSubrange(range.lowerBound..<ans.endIndex)
                            }
                        }
                        
                        if formattedSubLines == "\n" {
                            formattedAnswer = formattedAnswer + "\(ans)\n\n"
                        } else {
                            formattedAnswer = formattedAnswer + "\(ans)\(formattedSubLines)\n\n"
                        }
                    }
                    
                    cardTextLabel.text = formattedAnswer
                }
                
                flipCardBtn.setTitle("Next", for: .normal)
                questionsIndex += 1
                correctAnswersArray = []
                finalString = ""
            } else if !frontOfCard {
                if questions[questionsIndex].type == "question" {
                    let question = questions[questionsIndex].frontOfCard
                    let answersArray = questions[questionsIndex].answers
                    var answerString = "\n\n"
                    
                    answersArray?.forEach { answer in
                        if answer.contains("correct_") {
                            correctAnswersArray.append(answer.replacingOccurrences(of: "correct_", with: ""))
                        }
                    }
                    
                    answersArray?.forEach { answer in
                        let ans = answer.replacingOccurrences(of: "correct_", with: "")
                        answerString = answerString + "\(ans)\n"
                    }
                    
                    let questionText = question ?? ""
                    finalString = questionText + answerString
                    cardTextLabel.text = finalString
                    flipCardBtn.setTitle("See Answer", for: .normal)
                } else {
                    cardTextLabel.text = questions[questionsIndex].frontOfCard
                    
                    flipCardBtn.setTitle("Flip Card", for: .normal)
                }
                
                updateCount()
            }
        } else {
            questionsIndex = 0
            updateCount()
            cardTextLabel.text = questions[questionsIndex].frontOfCard
            
            if questions[questionsIndex].type == "question" {
                flipCardBtn.setTitle("See Answer", for: .normal)
            } else {
                flipCardBtn.setTitle("Flip Card", for: .normal)
            }
        }
        
        frontOfCard = !frontOfCard
    }
}
