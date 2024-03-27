//
//  RSPModel.swift
//  RSPSwift
//
//  Created by 이숲 on 3/13/24.
//

import Foundation

class RSPModel {
    func determineWinner(userChoice: String, computerChoice: String) -> String {
        if userChoice == computerChoice {
            return "Draw"
        } else if (userChoice == "Rock" && computerChoice == "Scissors") ||
                  (userChoice == "Scissors" && computerChoice == "Paper") ||
                  (userChoice == "Paper" && computerChoice == "Rock") {
            return "Win"
        } else {
            return "Lose"
        }
    }
}
