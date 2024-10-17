//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionView: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    var quizBrain = QuizBrain()
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateText(self.quizBrain.questionNumber)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Button pressed \(sender.currentTitle!)")
        let userAnswer = sender.currentTitle!
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
        
        isAnswerCorrect ? (sender.backgroundColor = UIColor.green) : (sender.backgroundColor = UIColor.red)
        
       quizBrain.nextQuestion()
        
       timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
           self.updateText(self.quizBrain.questionNumber)
            }
    }
    
    @objc func updateText(_ questionNumber: Int){
        questionView.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        trueBtn.backgroundColor = .clear
        falseBtn.backgroundColor = .clear
    }
}

