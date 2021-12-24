//
//  ViewController.swift
//  contatoreios
//
//  Created by Alessandro Guizzetti on 23/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateScores()
        updateMaxScore(to: 5.0)
    }
    @IBOutlet weak var stepperOne: UIStepper!
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var stepperTwo: UIStepper!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var stepperMax: UIStepper!
    @IBOutlet weak var max: UILabel!
    @IBAction func stepperOneChanged(_ sender: Any) {
        updateScores()
    }
    
    @IBAction func stepperTwoChanged(_ sender: Any) {
        updateScores()
    }
    @IBAction func stepperMaxChanged(_ sender: Any) {
        updateMaxScore(to: stepperMax.value)
    }
    func updateScores() {
        one.text = String(Int(stepperOne.value))
        two.text = String(Int(stepperTwo.value))
        isThereAWinner()

    }
    func isThereAWinner(){
        if stepperOne.value == stepperMax.value{
            andTheWinnerIs(player: 1)
            one.text = "⭕️"
            two.text = "❌"
        } else if stepperTwo.value == stepperMax.value{
            andTheWinnerIs(player: 2)
            two.text = "⭕️"
            one.text = "❌"
        }
    }
    @IBAction func reset(_ sender: Any) {
        stepperOne.value = 0
        stepperTwo.value = 0
        updateScores()
    }
    @IBAction func info(_ sender: Any) {
        let alert = UIAlertController(title: "Contatore", message: "versione 1.0 Beta 1\n © 2021 AleGSoftware\n\nAlessandro Guizzetti", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func updateMaxScore(to: Double){
        max.text = String(Int(to))
        stepperOne.maximumValue = to
        stepperTwo.maximumValue = to
    }
    func andTheWinnerIs(player: Int){
        let alert = UIAlertController(title: "Vincitore", message: "Il vincitore è il giocatore " + String(player), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
