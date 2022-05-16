//
//  MainMenuViewController.swift
//  Hangman
//
//  Created by Carolina Solis on 08/05/21.
//
//prueba
import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var fruitsveggiesButton: UIButton!
    @IBOutlet weak var countriesButton: UIButton!
    @IBOutlet weak var capitalsButton: UIButton!
    @IBOutlet weak var animalsButton: UIButton!
    @IBOutlet weak var colorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Menu"
        
        fruitsveggiesButton.layer.cornerRadius = 25.0
        countriesButton.layer.cornerRadius = 25.0
        capitalsButton.layer.cornerRadius = 25.0
        animalsButton.layer.cornerRadius = 25.0
        colorsButton.layer.cornerRadius = 25.0

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
