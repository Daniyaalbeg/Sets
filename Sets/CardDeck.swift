//
//  CardDeck.swift
//  Sets
//
//  Created by Daniyaal Beg on 12/01/2018.
//  Copyright © 2018 dan. All rights reserved.
//

import Foundation

struct CardDeck {
    private(set) var deck = [Card]()
    
    init() {
        for shape in Card.Shape.all {
            for color in Card.Color.all {
                for number in Card.Number.all {
                    for shading in Card.Shading.all {
                        deck.append(Card(shape: shape, color: color, number: number, shading: shading))
                    }
                }
            }
        }
    }
    
    mutating func draw() -> Card {
        return deck.remove(at: deck.count.arc4Random)
    }
}

extension Int {
    var arc4Random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
