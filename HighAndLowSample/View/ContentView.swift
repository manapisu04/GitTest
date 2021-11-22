//
//  ContentView.swift
//  HighAndLowSample
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

// View。ここに書いたコードがスマホの画面に表示される。
struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var isShowCard = false
    
    /// ゲーム数をカウントする。ViewModelにいれてもよかったかな
    @State var count = 0
    
    var body: some View {
        VStack {
            //勝ち負けを表示する。1ゲーム目開始前は何もなし
            Text(viewModel.comment)
            
            HStack {
                CardView(imageName: viewModel.firstCard)
                
                // highかlowを選ぶとカードが裏返る。
                if isShowCard {
                    CardView(imageName: viewModel.lastCard)
                } else {
                    CardView(imageName: "BK")
                }
            }
            
            HStack {
                Button {
                    isShowCard = true
                    count += 1
                    viewModel.comparisonAnswer(answer: "low")
                } label: {
                    Text("low")
                }
                Button {
                    isShowCard = true
                    count += 1
                    viewModel.comparisonAnswer(answer: "high")
                } label: {
                    Text("High")
                }
            }
            
            // もう一度ゲームを始める処理。
            // 現状27回目のゲームを行うとArrayIndexOutOfBoundsで落ちる。
            // FIXME: 26回目でもう一回ボタンが出なくなるような処理。できれば@Stateは使いたくないものですね〜…
            if isShowCard && count < 27 {
                Button {
                    isShowCard = false
                    viewModel.oneMore()
                } label: {
                    Text("もういっかい！")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
