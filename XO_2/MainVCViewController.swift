//
//  MainVCViewController.swift
//  XO_2
//
//  Created by MuhammadAli on 05/01/24.
//

import UIKit
import AVFoundation

class MainVCViewController: UIViewController, MainVCProtocol {
    
    
    private var player: AVAudioPlayer!
    
    var topLabel: UILabel!
    var buttimleftLbl: UILabel!
    var buttomRightLbl: UILabel!
    
    var btns : [UIButton] = []
    
    private var model: MainVCModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.model = MainVCModel(self)
        setupUI()
        self.audio()
    }
    
    private func audio() {
        let path = Bundle.main.path(forResource: "pencil", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    private func setupUI() {
        topLabel = UILabel()
        topLabel.frame = CGRect(x: spacingLeft, y: 80, width: buttonArea, height: 50)
        topLabel.text = "X O"
        topLabel.textColor = .kuk
        topLabel.layer.cornerRadius = 12
        topLabel.font = .boldSystemFont(ofSize: 32)
        topLabel.textAlignment = .center
        topLabel.layer.borderColor = UIColor.kuk.cgColor
        topLabel.layer.borderWidth = 3
        self.view.addSubview(topLabel)
        
        let containerView = UIView()
        containerView.frame = CGRect(x: spacingLeft, y: 250, width: buttonArea, height: buttonArea)
        containerView.backgroundColor = .black
        containerView.layer.cornerRadius = 12
        containerView.layer.borderColor = UIColor.kuk.cgColor
        containerView.layer.borderWidth = 3
        self.view.addSubview(containerView)
        
        buttimleftLbl = UILabel()
        buttimleftLbl.frame = CGRect(
            x: spacingLeft,
            y: 700,
            width: (windowWidth - (3 * spacingLeft)) / 2,
            height: 50)
        buttimleftLbl.textColor = .kuk
        buttimleftLbl.text = "X score: 0"
        buttimleftLbl.textAlignment = .center
        buttimleftLbl.layer.cornerRadius = 10
        buttimleftLbl.font = .boldSystemFont(ofSize: 25)
        buttimleftLbl.layer.borderColor = UIColor.kuk.cgColor
        buttimleftLbl.layer.borderWidth = 3
        self.view.addSubview(buttimleftLbl)
        
        buttomRightLbl = UILabel()
        buttomRightLbl.frame = CGRect(
            x: 2 * spacingLeft +  buttimleftLbl.frame.width,
            y: 700,
            width: (windowWidth - (3 * spacingLeft)) / 2,
            height: 50)
        buttomRightLbl.textColor = .kuk
        buttomRightLbl.text = "O score: 0"
        buttomRightLbl.textAlignment = .center
        buttomRightLbl.layer.cornerRadius = 10
        buttomRightLbl.font = .boldSystemFont(ofSize: 25)
        buttomRightLbl.layer.borderColor = UIColor.kuk.cgColor
        buttomRightLbl.layer.borderWidth = 3
        self.view.addSubview(buttomRightLbl)
        
        
        for i in 0 ... 2 {
            for j in 0 ... 2 {
                let button = UIButton(
                    frame: CGRect(
                        x: spacing + CGFloat(j) * (spacing + buttonWidth),
                        y: spacing + CGFloat(i) * (spacing + buttonWidth),
                        width: buttonWidth,
                        height: buttonWidth))
                button.setTitle("", for: .normal)
                button.tag = 3 * i + j
                button.setImage(UIImage(named: "none"), for: .normal)
                button.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
                btns.append(button)
                containerView.addSubview(button)
            }
        }
    }
    
    @objc func onButton(_ sender: UIButton) {
        self.model.pressedBtn(sender)
        self.player.play()
    }
    
    func scoreSendO(_ scoreO: String) {
        self.buttomRightLbl.text = scoreO
    }
    
    func scoreSendX(_ scoreX: String) {
        self.buttimleftLbl.text = scoreX
    }
    
    func topWin(_ top: String) {
        self.topLabel.text = top
    }
    
    func topTurn(_ turn: String) {
        self.topLabel.text = turn
    }
    
    func uidateUIButtons() {
        for i in btns {
            i.setTitle("", for: .normal)
            i.setImage(UIImage(named: "none"), for: .normal)
        }
    }
    
   
}
