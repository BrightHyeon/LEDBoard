//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by HyeonSoo Kim on 2021/12/17.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changeSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var contentField: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    var ledText: String?

    
    private func ledChange() {
        if let ledText = self.ledText {
            self.contentField.text = ledText
        }
        self.changeTextColor(color: textColor)
        self.changeBackgroundColor(color: backgroundColor)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ledChange()
    }
    
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        if sender == yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == purpleButton {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    
    @IBAction func tabBackgroundColorButton(_ sender: UIButton) {
        if sender == blackButton {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == blueButton {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        } else {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.changeSetting(
            text: self.contentField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
        )
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = color == .yellow ? 1 : 0.2
        self.purpleButton.alpha = color == .purple ? 1 : 0.2
        self.greenButton.alpha = color == .green ? 1 : 0.2
    }                                     //안써도 알아서 추론.
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
