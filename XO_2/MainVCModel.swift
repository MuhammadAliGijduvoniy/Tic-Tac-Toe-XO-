//
//  MainVCModel.swift
//  XO_2
//
//  Created by MuhammadAli on 05/01/24.
//

import UIKit

class MainVCModel {
    
    private var buttonString = ["","","","","","","","",""]
    
    private var Xachko = 0
    
    private var Oachko = 0
    
    private var mode: Gamer = .gamerX
    
    private var delegate: MainVCProtocol?
    
    
    
    init(_ delegate: MainVCProtocol) {
        self.delegate = delegate
    }
    
    private var winList = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    
    func pressedBtn(_ sender: UIButton) {
        if sender.title(for: .normal)!.count <= 0 {
            sender.setTitle(mode.title(), for: .normal)
            sender.setImage(mode.img(), for: .normal)
            
            self.buttonString[sender.tag] = self.mode.title()
            self.mode.tuggle()
            self.delegate?.topTurn("\(self.mode.title())'s turn")
            checkButton()
        }
    }
    
    func clearAll() {
        for i in 0..<buttonString.count {
            buttonString[i] = ""
        }
        self.delegate?.uidateUIButtons()
    }
    

    
    
    
    func checkButton() {
        if checkFor(type: .gamerX) != nil {
            self.delegate?.topWin("X yutdi")
            self.Xachko += 1
            self.delegate?.scoreSendX( "X score: \(self.Xachko)")
            clearAll()
        } else if checkFor(type: .gamerO) != nil {
            self.delegate?.topWin("O yutdi")
            self.Oachko += 1
            self.delegate?.scoreSendO("O score: \(self.Oachko)")

            clearAll()
        } else if gameOver() {
            self.delegate?.topWin("Game over")
            clearAll()
        }
    }
    
    func checkFor(type: Gamer) -> Gamer? {
        for win in winList {
            if buttonString[win[0]] == buttonString[win[1]],
               buttonString[win[1]] == buttonString[win[2]],
               buttonString[win[0]] == type.title() {
                return type
            }
        }
        return nil
    }
    
    private func gameOver() -> Bool {
        var over = true
        for i in buttonString {
            over = over && (i.count > 0)
        }
        return over
    }
    
}


