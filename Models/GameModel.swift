//
//  GameModel.swift
//  RSPSwift
//
//  Created by 이숲 on 3/13/24.
//

import Foundation

class GameModel {
    var userModel = UserModel()
    var rspModel = RSPModel()

    func playGame() -> String {
        let options = ["Rock", "Scissors", "Paper"]
        let computerChoice = options[Int.random(in: 0..<options.count)]
        guard let userChoice = userModel.userChoice else { return "Error: User choice not set" }
        return rspModel.determineWinner(userChoice: userChoice, computerChoice: computerChoice)
    }
}

