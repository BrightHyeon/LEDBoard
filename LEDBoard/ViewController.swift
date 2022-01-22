//
//  ViewController.swift
//  LEDBoard
//
//  Created by HyeonSoo Kim on 2021/12/17.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {

    @IBOutlet weak var contentLabel: UILabel!

    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentLabel.textColor = .yellow
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? SettingViewController else { return }
        viewController.delegate = self
        viewController.ledText = self.contentLabel.text
        viewController.textColor = self.contentLabel.textColor
        viewController.backgroundColor = self.view.backgroundColor
    }
    
    func sendData(ledText: String?, textColor: UIColor, backgroundColor: UIColor) {
        guard let ledText = ledText else { return }
        self.contentLabel.text = ledText
        self.contentLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
    
}

