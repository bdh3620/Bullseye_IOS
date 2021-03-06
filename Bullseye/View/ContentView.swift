//
//  ContentView.swift
//  Bullseye
//
//  Created by λ°±λν on 2022/03/07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("π―μ΅λν κ°κΉμ΄ μ«μλ₯Ό λ§μΆ°λ³΄μΈμ!!π―")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote) 
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                Slider(value: $sliderValue , in:1.0...100.0)
                Text("100")
                    .bold()
            }
            Button(action: {
                print("hello")
                alertVisible = true
            }) {
                Text("Hit me")
                }
            .alert(isPresented: $alertVisible,
                   content:
                    {
                let roundedValue =
                Int(sliderValue
                         .rounded())
                return Alert(title: Text("κ²°κ³Όλ??"), message: Text("λΉμ μ μλ ₯κ°μ\(roundedValue)μ !!\n" + "μ΄λ²λΌμ΄λμ λΉμ μ\(game.points(sliderValue: roundedValue)) μ μ νλνμ΅λλ€."), dismissButton: .default(Text ("λ©μ§λ€μ~")))
                })
            }
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 570 , height: 320))
    }
}
