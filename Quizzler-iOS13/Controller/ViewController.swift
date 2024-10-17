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
    @IBOutlet weak var firstOptionBtn: UIButton!
    @IBOutlet weak var secondOptionBtn: UIButton!
    @IBOutlet weak var thirdOptionBtn: UIButton!
    @IBOutlet weak var scoreView: UILabel!
    
    var quizBrain = QuizBrain()
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateText(self.quizBrain.questionNumber)
        scoreView.text = "Score: \(quizBrain.score)"
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
        scoreView.text = "Score: \(quizBrain.score)"
        let buttons = [0: firstOptionBtn, 1 : secondOptionBtn, 2 : thirdOptionBtn]
        
        questionView.text = quizBrain.getQuestionText()
        
        for button in buttons {
            button.value?.backgroundColor = .clear
            button.value?.setTitle(quizBrain.getAnswerText(at: button.key), for: .normal)
        }
        progressBar.progress = quizBrain.getProgress()

    }
}

