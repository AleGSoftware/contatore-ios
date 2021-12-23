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
    }
    @IBOutlet weak var stepperOne: UIStepper!
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var stepperTwo: UIStepper!
    @IBOutlet weak var two: UILabel!
    @IBAction func stepperOneChanged(_ sender: Any) {
        updateScores()
    }
    
    @IBAction func stepperTwoChanged(_ sender: Any) {
        updateScores()
    }
    func updateScores() {
        one.text = String(Int(stepperOne.value))
        two.text = String(Int(stepperTwo.value))

    }
    @IBAction func reset(_ sender: Any) {
        stepperOne.value = 0
        stepperTwo.value = 0
        updateScores()
    }
    @IBAction func info(_ sender: Any) {
        let alert = UIAlertController(title: "Contatore", message: "version 1.0alpha\n©2021 AleGSoftware\n\nAlessandro Guizzetti", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
