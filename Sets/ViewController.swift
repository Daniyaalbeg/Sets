//
//  ViewController.swift
//  Sets
//
//  Created by Daniyaal Beg on 11/01/2018.
//  Copyright © 2018 dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var game: Sets = Sets() {
        didSet {
            updateViewFromModel()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonRound()
        updateViewFromModel()
    }

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func selectCard(_ sender: UIButton) {
        if let buttonIndex = buttons.index(of: sender) {
            if buttonIndex < game.cardsInPlay.count {
                game.chooseCard(at: buttonIndex)
                updateViewFromModel()
            }
        }
    }
    
    private func updateViewFromModel() {
        for cardButtonIndex in buttons.indices {
            let button = buttons[cardButtonIndex]
            if cardButtonIndex < game.cardsInPlay.count {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                let attributedString = NSAttributedString(string: getSymbol(at: cardButtonIndex), attributes: getAttribute(at: cardButtonIndex))
                button.setAttributedTitle(attributedString, for: .normal)
                button.layer.borderWidth = 0
                if game.selectedCards.contains(game.cardsInPlay[cardButtonIndex]) {
                    button.layer.borderWidth = 3.0
                    button.layer.borderColor = #colorLiteral(red: 0.9843137255, green: 0.9882352941, blue: 0.368627451, alpha: 1)
                }
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
        scoreLabel.text = "Score : \(game.score)"
    }

    private func setButtonRound() {
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }

    private func getAttribute(at index: Int) -> [NSAttributedStringKey : Any] {
        var attribute : [NSAttributedStringKey : Any]
        var color: UIColor
        switch game.cardsInPlay[index].color {
        case .color1:
            color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            attribute = [.foregroundColor: color]
        case .color2:
            color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            attribute = [.foregroundColor: color]
        case .color3:
            color = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            attribute = [.foregroundColor: color]
        }
        switch game.cardsInPlay[index].shading {
        case .shading1:
            return attribute
        case .shading2:
            attribute[.strokeWidth] = 5.0
        case .shading3:
            attribute[.foregroundColor] = color.withAlphaComponent(0.2)
        }
        return attribute
    }

    private func getSymbol(at index: Int) -> String {
        var shape: String
        switch game.cardsInPlay[index].shape {
        case .shape1:
            shape = "▲"
        case .shape2:
            shape = "●"
        case .shape3:
            shape = "■"
        }

        switch game.cardsInPlay[index].number {
        case .number1:
            return shape
        case .number2:
            return shape + shape
        case .number3:
            return shape + shape + shape
        }
    }
    
    @IBAction func deal3MoreCards(_ sender: UIButton) {
        if game.cardsInPlay.count < 24 {
            game.draw3Cards()
        }
        updateViewFromModel()
    }
    @IBAction func newGame(_ sender: UIButton) {
        game = Sets()
    }
}

