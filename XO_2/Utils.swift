//
//  Utils.swift
//  XO_2
//
//  Created by MuhammadAli on 06/01/24.
//

import UIKit


enum Gamer {
    case gamerX
    case gamerO
    case none
    
    func title() -> String {
        switch self {
        case .gamerX:
            return "X"
        case .gamerO:
            return "O"
        case .none:
            return ""
        }
    }
    
    
    mutating func tuggle() {
        switch self {
        case .gamerX:
            self = .gamerO
        case .gamerO:
            self = .gamerX
        case .none:
            break
        }
    }
    
    
    func img() -> UIImage {
        switch self {
        case .gamerX:
            return UIImage(named: "X")!
        case .gamerO:
            return UIImage(named: "O")!
        case .none:
            return UIImage(named: "none")!
        }
    }
}

enum LGamer {
    case gamerX
    case gamerO
    
    func title() -> String {
        switch self {
        case .gamerX: return "X's turn"
        case .gamerO: return "O's turn"
        }
    }
    
    func img() -> UIImage {
        switch self {
        case .gamerX: return UIImage(named: "X")!
        case .gamerO: return UIImage(named: "O")!
        }
    }
    
   mutating func tuggle() {
        switch self {
        case .gamerX: return self = .gamerO
        case .gamerO: return self = .gamerX
        }
    }
}
