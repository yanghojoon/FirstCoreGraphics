//
//  ViewController.swift
//  FirstCoreGraphicsPractice
//
//  Created by 양호준 on 2022/02/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plusButton: PlusButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rotatePlusButton(_ sender: PlusButton) {
        if sender.isSelected {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut) {
                self.plusButton.transform = CGAffineTransform(rotationAngle: 0)
            } completion: { finished in
                print("다시 돌아왔다 🤪")
                sender.isSelected = false
            }
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut) {
                self.plusButton.transform = CGAffineTransform(rotationAngle: (.pi / 4))
            } completion: { finished in
                print("돌아갔다 🤪")
                sender.isSelected = true
            }
        }
    }
}

