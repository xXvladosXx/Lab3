//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    var icons = ["🐨","🦊","🐯","🦁","🐻‍❄️","🐼","🐸","🐔"]
    @State private var cardCount = 6
    @State var CardNumber: Int = 6
    var column = [GridItem(.flexible(minimum: 120), spacing: 10),
                  GridItem(.flexible(minimum: 50), spacing: 10)]
    var cardDelete: some View {
        cardAdjustmentButton(offset: -2, symbol: "-")
    }
    var cardAdd: some View {
        cardAdjustmentButton(offset: 2, symbol: "+")
    }
    
    var cardDisplay: some View {
            ScrollView {
                LazyVGrid(columns: column, content: {
                    ForEach(0..<CardNumber, id:\.self) { i in
                        
                        let random = icons.randomElement()
                            CardView(item: random!)
                        
                    }
                })
                .foregroundColor(.blue)
                .padding(12)
            }
        }
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
            cardDisplay
        }

        HStack {
            cardDelete
            Spacer()
            cardAdd
        }
        .padding(.horizontal, 20)
    }
    
    
    func cardAdjustmentButton(offset: Int, symbol: String) -> some View {
            var isEnabled = true
        
            if(offset < 0)
            {
                isEnabled = CardNumber > 2
            }
            
            return Button( action: {
                if isEnabled {
                    self.adjustCardNumber(by: offset)
                }
            }) {
                if isEnabled {
                    Text(symbol)
                        .font(.title)
                } else {
                    Text(symbol)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .disabled(!isEnabled)
            .frame(width: 80, height: 40)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.blue, lineWidth: 2)
                    }
                )
        }

        func adjustCardNumber(by offset: Int) {
            CardNumber += offset
        }
    
}



#Preview {
    ContentView()
}
