//
//  ViewController.swift
//  Focus
//
//  Created by Shivam Dev on 22/02/18.
//  Copyright © 2018 Shivam Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCounts = 0 {
        
        didSet {
            flipCount.text = "FLIPS : \(flipCounts)"
        }
    }
    
    @IBOutlet weak var flipCount: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoice = ["😈", "👹", "👺", "🎃", "👻", "🤡", "😈", "👹", "👺", "🎃", "👻", "🤡"].shuffled()
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCounts += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
        } else {
            print("Chossen card was not in cardButtons")
        }
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9479038119, green: 0.5719761252, blue: 0.2384497225, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

