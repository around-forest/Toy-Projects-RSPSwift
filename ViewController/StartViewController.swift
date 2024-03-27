//
//  ViewController.swift
//  RSPSwift
//
//  Created by 이숲 on 3/25/24.
//

import UIKit

final class StartViewController: UIViewController {
    
    // MARK: - UI Components
    private let nicknameLabel = UILabel()
    private let nicknameTextField = UITextField()
    private let recommandButton: UIButton
    private let fruitsSegmentedControl = UISegmentedControl(items: TextConstant.picFruitsText)
    private let imageView = UIImageView()
    private let nextButton = UIButton(type: .system)
    
    // MARK: - Properties
    private let gameModel = GameModel()
    
    // MARK: - Initializers
    init() {
        recommandButton = UIButton(type: .system)
        super.init(nibName: nil, bundle: nil)

        setRecommandButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - StartView Lifecycle
    /*
     override func loadView() {
     // UIView는 개발자가 커스텀하여 구성한 view 화면이라 가정
     }
     */
    
    override func viewDidLoad() {
        // view가 memory에 올라온 후 한번만 호출, view가 메모리에서 해제되었다면 다시 호출
        super.viewDidLoad()
        setViewAttribute()
        setViewHierachies()
        setViewConstraints()
    }
    
    /*
     override func viewWillAppear(_ animated: Bool) {
     // view를 띄울 때마다 호출 -> view 갱신이 필요한 상황
     super.viewWillAppear(<#T##animated: Bool##Bool#>)
     }
     
     override func viewDidAppear(_ animated: Bool) {
     // screen에 view가 나타난 후 호출. animation 등 view가 나타난 후 필요한 작업 처리
     super.viewDidAppear(<#T##animated: Bool##Bool#>)
     }
     
     override func viewWillDisappear(_ animated: Bool) {
     // screen에서 view가 사라지기 전에 호출. 진행중인 작업을 종료시키는 작업 처리
     super.viewWillDisappear(<#T##animated: Bool##Bool#>)
     }
     
     override func viewDidDisappear(_ animated: Bool) {
     // screen에서 view가 사라진 후 호출. screen에서 내려갔을 뿐, memory에서 해제된 것은 아님
     super.viewDidDisappear(animated)
     }
     
     deinit {
     // print("Test deinit : \(#function)")
     }
     */
}

// MARK: - UI Configure
private extension StartViewController {
    enum TextConstant {
        static let nicknameText = "닉네임"
        static let nicknameTextField = "닉네임을 입력하세요"
        static let recommandButtonText = "추천"
        static let picFruitsText = ["apple", "banana", "lime", "grape"]
        static let pictureText = "원하는 이미지를 고르세요"
        static let nextButtonText = "다음"
    }
    
    enum NicknameLayoutConstant {
        static let textFieldTopPadding = 10.0
        static let textFieldLeadingPadding = 10.0
        static let textFieldTrailingPadding = -10.0
    }
    
    enum ButtonLayoutConstant {
        static let buttonCornerRadius = 25.0
        static let buttonBorderWidth = 0.5
        static let buttonLeadingPadding = 10.0
        static let buttonTrailingPadding = -10.0
        static let buttonBottomPadding = 20.0
        static let buttonHeight = 50.0
    }
    
    func setViewAttribute() {
        if #available(iOS 14.0, *) {
            view.backgroundColor = .background
        } else {
            view.backgroundColor = .white
        }
        setNicknameLabel()
        setNicknameTextField()
        setFruitsSegmentedControl()
        setImageView()
        setNextButton()
    }
    
    func setNicknameLabel() {
        nicknameLabel.numberOfLines = 0
        nicknameLabel.textAlignment = .center
        nicknameLabel.text = TextConstant.nicknameText
        nicknameLabel.textColor = .black
    }
    
    func setNicknameTextField() {
        nicknameTextField.backgroundColor = .lightGray
        nicknameTextField.placeholder = TextConstant.nicknameTextField
        nicknameTextField.borderStyle = .roundedRect
    }
    
    func setRecommandButton() {
        recommandButton.layer.cornerRadius = ButtonLayoutConstant.buttonCornerRadius
        recommandButton.backgroundColor = .blue
        recommandButton.setTitle(TextConstant.recommandButtonText, for: .normal)
        recommandButton.setTitleColor(.background, for: .normal)
        recommandButton.layer.borderWidth = ButtonLayoutConstant.buttonBorderWidth
    }
    
    func setFruitsSegmentedControl() {
        fruitsSegmentedControl.selectedSegmentIndex = 0
        fruitsSegmentedControl.addTarget(self, action: #selector(fruitSegmentChanged(_:)), for: .valueChanged)
    }
    
    func setImageView() {
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
    }
    
    func setNextButton() {
        nextButton.setTitle(TextConstant.nextButtonText, for: .normal)
    }
    
    func setViewHierachies() {
        [
            nicknameLabel,
            nicknameTextField,
            fruitsSegmentedControl,
            imageView,
            nextButton
            
            
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    func setViewConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            nicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nicknameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nicknameTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: NicknameLayoutConstant.textFieldTopPadding),
            nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NicknameLayoutConstant.textFieldLeadingPadding),
            nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: NicknameLayoutConstant.textFieldTrailingPadding),
            
            fruitsSegmentedControl.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: NicknameLayoutConstant.textFieldTopPadding),
            fruitsSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: NicknameLayoutConstant.textFieldLeadingPadding),
            fruitsSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: NicknameLayoutConstant.textFieldTrailingPadding),
            
            imageView.topAnchor.constraint(equalTo: fruitsSegmentedControl.bottomAnchor, constant: ButtonLayoutConstant.buttonBottomPadding),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ButtonLayoutConstant.buttonLeadingPadding),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ButtonLayoutConstant.buttonTrailingPadding),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            nextButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: ButtonLayoutConstant.buttonBottomPadding),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: ButtonLayoutConstant.buttonTrailingPadding)
        ])
    }
    
    // MARK: - Actions
    @objc func fruitSegmentChanged(_ sender: UISegmentedControl) {
        let fruitName =  fruitsSegmentedControl.titleForSegment(at: fruitsSegmentedControl.selectedSegmentIndex) ?? ""
        displayFruitImage(named: fruitName)
    }
    
    func displayFruitImage(named fruitName: String) {
        //imageView.image = UIImage(named: fruitName)
        imageView.backgroundColor = .darkGray
    }
}

// MARK: - UIColor
extension UIColor {
    static let background = UIColor(named: "background")
}

