//
//  ViewController.swift
//  contatoreios
//
//  Created by Alessandro Guizzetti on 23/12/21.
//

import UIKit
import AVFoundation
var audioPlayer : AVPlayer!
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
    @IBOutlet weak var g1Label: UILabel!
    @IBOutlet weak var g2Label: UILabel!
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
        let alert = UIAlertController(title: "Contatore", message: "versione 1.0 Beta 2\n © 2021 AleGSoftware\n\nAlessandro Guizzetti\n\nWin Sound: Mativve from Freesound.org", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func settings(_ sender: Any) {
        var textField = UITextField()
        var textField2 = UITextField()
                    
                    let alert = UIAlertController(title: "Imposta nomi", message: "", preferredStyle: .alert)
                    alert.addTextField { alertTextField in
                        alertTextField.placeholder = "Giocatore 1"
                        textField = alertTextField
                    }
        alert.addTextField { alertTextField2 in
            alertTextField2.placeholder = "Giocatore 2"
            textField2 = alertTextField2
        }
                    
                    let action = UIAlertAction(title: "Salva", style: .default) { action in
                        print("PNSET")
                        self.g1Label.text = textField.text!
                        self.g2Label.text = textField2.text!
                        
                    }
                    
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)

        
        
    }
    func updateMaxScore(to: Double){
        max.text = String(Int(to))
        stepperOne.maximumValue = to
        stepperTwo.maximumValue = to
    }
    func andTheWinnerIs(player: Int){
        var winner = String()
        if player == 1{
            winner = g1Label.text!
        }else if player == 2 {
            winner = g2Label.text!
        }
        playWinSound()
        let alert = UIAlertController(title: "Vincitore", message: "Il vincitore è il giocatore \"\(winner)\"!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    private func playWinSound() {
            guard let url = Bundle.main.url(forResource: "winsound", withExtension: "wav") else {
                print("error to get the mp3 file")
                return
            }

            do {
                audioPlayer = try AVPlayer(url: url)
            } catch {
                print("audio file error")
            }
            audioPlayer?.play()
    }
}
