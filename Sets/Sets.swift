//
//  Sets.swift
//  Sets
//
//  Created by Daniyaal Beg on 11/01/2018.
//  Copyright © 2018 dan. All rights reserved.
//

import Foundation

struct Sets {
    private var cardDeck = CardDeck()
    private(set) var cardsInPlay = [Card]()
    private let initalNumberOfCards = 12
    private(set) var selectedCards = [Card]()
    private(set) var score = 0
    
    init() {
        setupGame()
    }
    
    mutating func chooseCard(at index: Int) {
        if !selectedCards.contains(cardsInPlay[index]) {
            selectedCards += [cardsInPlay[index]]
            if selectedCards.count == 3 {
                if checkSets() {
                    score += 3
                    cardsInPlay = cardsInPlay.filter({ !selectedCards.contains($0) })
                    selectedCards.removeAll()
                    draw3Cards()
                } else {
                    selectedCards.removeAll()
                    score -= 1
                }
            }
        } else {
            selectedCards.remove(at: selectedCards.index(of: cardsInPlay[index])!)
        }
    }
    
    private func checkSets() -> Bool {
        if checkCard(filteredArray: selectedCards.map({ $0.shape })),
            checkCard(filteredArray: selectedCards.map({ $0.color })),
            checkCard(filteredArray: selectedCards.map({ $0.number })),
            checkCard(filteredArray: selectedCards.map({ $0.shading })) {
            return true
        }
        return false
    }
    
    private func checkCard<T: Hashable>(filteredArray: [T]) -> Bool {
        let set = Set(filteredArray)
        if set.count == 1 || set.count == 3 {
            return true
        } else {
            return false
        }

    }

    mutating func draw3Cards() {
        if cardsInPlay.count < 24, cardDeck.deck.count > 0 {
            for _ in 0..<3 {
                cardsInPlay.append(cardDeck.draw())
            }
        }
    }
    
    private mutating func setupGame() {
        for _ in 0..<initalNumberOfCards {
            cardsInPlay.append(cardDeck.draw())
        }
    }
    
}
