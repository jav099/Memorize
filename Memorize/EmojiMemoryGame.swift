//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Javier Contreras on 6/1/20.
//  Copyright © 2020 Javier Contreras. All rights reserved.
//


// THIS IS THE VIEWMODEL
import SwiftUI

class EmojiMemoryGame: ObservableObject {
  
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    static let numberOfPairs = Int.random(in: 2...5)
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃", "🕷","🧙🏻‍♂️", "🧟‍♀️"]
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
