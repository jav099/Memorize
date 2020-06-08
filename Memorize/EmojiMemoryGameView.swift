//
//  ContentView.swift
//  Memorize
//
//  Created by Javier Contreras on 5/27/20.
//  Copyright © 2020 Javier Contreras. All rights reserved.
//


//THIS IS THE VIEW IN MVVM


import SwiftUI


//struct name: specifying that it behaves like a view
struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    //also called a property
    //var name: type
    /*
     curly bracket means that the code gets executed every time it is called,
     it is not stored in memory.
     "some" acts like a templated var in C++, lets the compiler figure it out
     */
    var body: some View {
        Grid(viewModel.cards) { card in
            //combining both views
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            
        }
            .padding()
            .foregroundColor(Color.orange)
            
            
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
        
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
            
        }
            .aspectRatio(2/3, contentMode: .fit)
            .font(Font.system(size:
            min(size.width,size.height) * fontScaleFactor))
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
}


//provides glue between the code and preview onthe right
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

