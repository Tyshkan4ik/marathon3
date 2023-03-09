//
//  ViewController.swift
//  3 marathon
//
//  Created by Виталий Троицкий on 09.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        myView.layer.cornerRadius = 5
        animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear, animations: {
            self.myView.transform = CGAffineTransform(rotationAngle: (.pi) / 2).scaledBy(x: 1.5, y: 1.5)
            self.myView.frame = self.myView.frame.offsetBy(dx: self.view.frame.width - self.myView.frame.width - self.view.layoutMargins.right, dy: 0)
            
            self.animator.pausesOnCompletion = true
        })
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            myView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            myView.heightAnchor.constraint(equalToConstant: 80),
            myView.widthAnchor.constraint(equalToConstant: 80),
            
            slider.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 50),
            slider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)

        ])
    }
    @IBAction func sliderGo(_ slider: UISlider) {
        animator.fractionComplete = CGFloat(slider.value)
    }
    
    @IBAction func finishSlider(_ sliders: UISlider) {
        if animator.isRunning {
            slider.value = Float(animator.fractionComplete)
        }
        slider.setValue(slider.maximumValue, animated: true)
        animator.startAnimation()
    }

}

