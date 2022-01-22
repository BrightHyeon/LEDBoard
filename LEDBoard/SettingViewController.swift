//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by HyeonSoo Kim on 2021/12/17.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(ledText: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var contentField: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    //MARK: - Storage var
    var ledText: String?
    var textColor: UIColor!
    var backgroundColor: UIColor!
    
    weak var delegate: SendDataDelegate?
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    //MARK: - IBAction
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        if sender == yellowButton {
            self.textColor = .yellow
            self.changeTextColorButtonAlpha(color: .yellow)
        } else if sender == purpleButton {
            self.textColor = .purple
            self.changeTextColorButtonAlpha(color: .purple)
        } else {
            self.textColor = .green
            self.changeTextColorButtonAlpha(color: .green)
        }
    }
    
    @IBAction func tabBackgroundColorButton(_ sender: UIButton) {
        if sender == blackButton {
            self.backgroundColor = .black
            self.changeBackgroundColorButtonAlpha(color: .black)
        } else if sender == blueButton {
            self.backgroundColor = .blue
            self.changeBackgroundColorButtonAlpha(color: .blue)
        } else {
            self.backgroundColor = .orange
            self.changeBackgroundColorButtonAlpha(color: .orange)
        }
    }
    
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.sendData(ledText: contentField.text, textColor: self.textColor, backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Method
    private func changeTextColorButtonAlpha(color: UIColor) {
        self.yellowButton.alpha = color == .yellow ? 1 : 0.2
        self.purpleButton.alpha = color == .purple ? 1 : 0.2
        self.greenButton.alpha = color == .green ? 1 : 0.2
    }
    
    private func changeBackgroundColorButtonAlpha(color: UIColor) {
        self.blackButton.alpha = color == .black ? 1 : 0.2
        self.blueButton.alpha = color == .blue ? 1 : 0.2
        self.orangeButton.alpha = color == .orange ? 1 : 0.2
    }
    
    private func configureView() {
        if let ledText = ledText {
            self.contentField.text = ledText
        }
        self.changeTextColorButtonAlpha(color: self.textColor)
        self.changeBackgroundColorButtonAlpha(color: self.backgroundColor)
    }
    
}
