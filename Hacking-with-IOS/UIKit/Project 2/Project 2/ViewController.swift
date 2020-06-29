//
//  ViewController.swift
//  Project 2
//
//  Created by David Mascall on 27/06/2020.
//  Copyright © 2020 David Mascall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var attempts = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        correctAnswer = Int.random(in: 0...2)

        title = countries[correctAnswer].uppercased()+" Your Score: \(score) Attempts: \(attempts)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
        title = "Correct"
            score += 1
        } else {
            title = "Wrong! Thats The Flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }

        attempts += 1

        if attempts < 10 {

            let alc = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            alc.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alc, animated: true)
        } else {
            let alc = UIAlertController(title: title, message: "Your final score is \(score).", preferredStyle: .alert)
            alc.addAction(UIAlertAction(title: "End", style: .default, handler: askQuestion))
            present(alc, animated: true)

            attempts = 0
            score = 0
            }

        }
}
