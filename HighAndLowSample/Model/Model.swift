//
//  Model.swift
//  HighAndLowSample
//
//  Created by cmStudent on 2021/11/22.
//

import Foundation

// FIXME:全体的に可読性がひどい

// 直接Viewに関係のない処理。ここでの返り値はViewModelで使われ、Viewでは使われない
class Model {
    /// カードを生成するための配列
    private var cards:[Int] = []
    
    /// デバッグ用
    var counter = 0
    
    init(){
        // 一度、1から54までを配列にしちゃう。initせず直書きでもいいけど書くのが面倒。forで回す
        for cardNumber in 1...54 {
            cards.append(cardNumber)
        }
    }
    
    /// カードの画像名と、カードの数字を返す。
    func fuga() -> (cardName:String, number:Int) {
        let mark: String
        var number: Int
        
        let piyo = hoge()
        
        switch piyo {
        case ...13:
            mark = "H"
        case ...26:
            mark = "D"
        case ...39:
            mark = "C"
        case ...52:
            mark = "S"
        case 53:
            mark = "JKR"
        default:
            mark = "JKB"
        }
        
        // 1-13の間の整数を作る。
        if(piyo < 53) {
            number = piyo % 13
            if number == 0 {
                number = 13
            }
        } else {
            //　ジョーカーがでたとき。ジョーカーが一番強い
            number = 99
        }
        
        counter += 1
        print(counter)
        print(cards)
        return (makeCard(mark: mark, number: number), number)
    }
    
    /// 表示するカードの画像名を作る。Assetsの中の画像名変えるのが面倒なので、文字列結合を利用する。
    private func makeCard(mark: String, number: Int) -> String {
        
        if number < 10 {
            return "\(mark)0\(number)"
        } else if number <= 13 {
            return "\(mark)\(number)"
        } else {
            return "\(mark)"
        }
    }
    
    /// 配列の中から要素を一つ選び、その要素を二度と場に出さないための処理。
    private func hoge() -> Int {
        // cardの配列からひとつ取る。
        let randomIndex = Int.random(in: 0..<cards.count)
        let card = cards[(randomIndex)]
        
        // 配列の要素を削除する。これで二度と同じ数字が出なくなる。
        cards.remove(at: randomIndex)
        
        return card
    }
}
