//
//  GameViewController.swift
//  RSPSwift
//
//  Created by 이숲 on 3/25/24.
//

import UIKit

class GameViewController: UIViewController {
    var gameModel: GameModel?

    // 가위, 바위, 보 버튼 정의
    let rockButton = UIButton()
    let scissorsButton = UIButton()
    let paperButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // UI 구성 및 레이아웃 설정
        // 각 버튼에 대한 액션 설정
        // ...
    }

    // 가위, 바위, 보 선택 액션
    @objc func chooseOption(_ sender: UIButton) {
        // sender의 타이틀을 사용하여 사용자의 선택을 gameModel에 저장
        // 결과 화면으로 전환
        // ...
    }
}
