//
//  ContentView.swift
//  Bullseye
//
//  Created by 백대홍 on 2022/03/07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯최대한 가까운 숫자를 맞춰보세요!!🎯")
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
                return Alert(title: Text("결과는??"), message: Text("당신의 입력값은\(roundedValue)점!!\n" + "이번라운드에 당신은\(game.points(sliderValue: roundedValue)) 점을 획득했습니다."), dismissButton: .default(Text ("멋지네요~")))
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
