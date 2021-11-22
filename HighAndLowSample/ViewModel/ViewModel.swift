//
//  ViewModel.swift
//  HighAndLowSample
//
//  Created by cmStudent on 2021/11/22.
//

import Foundation

// ViewとModelの橋渡しの処理。ここでの返り値や、@Published変数は基本Viewで使われる。Viewに直接関係する処理をここに書く
class ViewModel: ObservableObject {
    @Published var firstCard: String
    @Published var lastCard: String
    @Published var comment = ""
    
    var firstNumber: Int
    var lastNumber: Int
    
    let model: Model
    
    //　初期化処理。戻り値がString,Intの順のタプルで帰ってくる。可読性いと低し。
    init() {
        model = Model()
        (firstCard, firstNumber) = model.fuga()
        (lastCard, lastNumber) = model.fuga()
    }
    
    // もういっかい！が押された時の処理。カードをセットし直す
    // 戻り値がString,Intの順のタプルで帰ってくる
    func oneMore() {
        (firstCard, firstNumber) = model.fuga()
        (lastCard, lastNumber) = model.fuga()
    }
    
    /// ユーザーが選択した答えがあってれば勝ち。答え合わせの処理。
    func comparisonAnswer(answer:String) {
        if judge() == answer {
            comment = "勝ち"
        } else {
            comment = "負け"
        }
    }
    
    // 正解
    private func judge() -> String {
        if firstNumber > lastNumber {
            return "low"
        } else if firstNumber < lastNumber {
            return "high"
        } else {
            //イコールの時
            return "lose"
        }
    }
    
    
}
