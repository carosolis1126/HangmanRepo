//
//  FruitsVeggiesViewController.swift
//  MultipleScreens
//
//  Created by Carolina Solis on 08/02/21.
//

import UIKit

class FruitsVeggiesViewController: UIViewController {

    @IBOutlet weak var hangmanimage: UIImageView!
    @IBOutlet weak var displayTrans: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var winorlose: UILabel! //label display win or lose
    @IBOutlet weak var displayedWord: UILabel! //displays dashes and letters guessed correctly
    @IBOutlet weak var newgame: UIButton!
    
    //letters outlets
    @IBOutlet weak var letterA: UIButton!
    @IBOutlet weak var letterB: UIButton!
    @IBOutlet weak var letterC: UIButton!
    @IBOutlet weak var letterD: UIButton!
    @IBOutlet weak var letterE: UIButton!
    @IBOutlet weak var letterF: UIButton!
    @IBOutlet weak var letterG: UIButton!
    @IBOutlet weak var letterH: UIButton!
    @IBOutlet weak var letterI: UIButton!
    @IBOutlet weak var letterJ: UIButton!
    @IBOutlet weak var letterK: UIButton!
    @IBOutlet weak var letterL: UIButton!
    @IBOutlet weak var letterM: UIButton!
    @IBOutlet weak var letterN: UIButton!
    @IBOutlet weak var letterO: UIButton!
    @IBOutlet weak var letterP: UIButton!
    @IBOutlet weak var letterQ: UIButton!
    @IBOutlet weak var letterR: UIButton!
    @IBOutlet weak var letterS: UIButton!
    @IBOutlet weak var letterT: UIButton!
    @IBOutlet weak var letterU: UIButton!
    @IBOutlet weak var letterV: UIButton!
    @IBOutlet weak var letterW: UIButton!
    @IBOutlet weak var letterX: UIButton!
    @IBOutlet weak var letterY: UIButton!
    @IBOutlet weak var letterZ: UIButton!
    
    var wordtoguess = "" //word to guess
    var translatedword = ""
    var letterArray = [" "] //array of letters in word to guess
    var guessedLetters = [""] //array of letters guessed
    var dashes = [""] //array displaying dashes to guess
    var initialArray = [""]
    var initialTranslation = [""]
    
    var i = 1 //variable used to change pictures
    
    //read txt file
    func readtextfile(inputArray: Array<String>,filename:String) -> Array<String> {
        let filePath = Bundle.main.path(forResource: filename, ofType: "txt")!
        var myCounter: Int
        var newArray = inputArray
        newArray.remove(at: 0)//removes initial empty space value from array
        do {
            let contents = try String(contentsOfFile: filePath)
            let lines = contents.split(separator:"\n")
            myCounter = lines.count //number of lines
            
            for n in 0...(myCounter - 1){
                newArray.append(String(lines[n]))
            }
        } catch {
            //return(error.localizedDescription)
        }
        return newArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fruits and Veggies"
        
        winorlose.text = ""//initially blank
        translationLabel.text = "Press Below to Start a New Game"
        displayTrans.text = ""
        
        newgame.layer.cornerRadius = 18.0
        
    }
        
    
    @IBAction func generateWord(_ sender: Any){
        //display all letters
        letterA.isHidden = false
        letterB.isHidden = false
        letterC.isHidden = false
        letterD.isHidden = false
        letterE.isHidden = false
        letterF.isHidden = false
        letterG.isHidden = false
        letterH.isHidden = false
        letterI.isHidden = false
        letterJ.isHidden = false
        letterK.isHidden = false
        letterL.isHidden = false
        letterM.isHidden = false
        letterN.isHidden = false
        letterO.isHidden = false
        letterP.isHidden = false
        letterQ.isHidden = false
        letterR.isHidden = false
        letterS.isHidden = false
        letterT.isHidden = false
        letterU.isHidden = false
        letterV.isHidden = false
        letterW.isHidden = false
        letterX.isHidden = false
        letterY.isHidden = false
        letterZ.isHidden = false
        
        i = 1 //reset errors
        
        translationLabel.text = ""
        displayTrans.text = ""
        guessedLetters = [""]
        dashes = [""]
        winorlose.text = ""
        i = 1
        let animArray = readtextfile(inputArray: initialArray, filename: "fruitsandveggies")//read words text file
        let translationArray = readtextfile(inputArray: initialTranslation,filename: "fruitsveggiestranslation")//read translation text file
        print(animArray)
        print(translationArray)
        let length = animArray.count
        let randomnumber = Int.random(in: 0...length-1) //generate random number
        wordtoguess = String(animArray[randomnumber])
        print(wordtoguess) //random word from array of animal words
        translatedword = String(translationArray[randomnumber])
        print(translatedword) //translation of random word
        hangmanimage.image = UIImage(named: "fruitsveggies") //initial hangman image
        dashes.append(contentsOf: repeatElement("_", count: wordtoguess.count))
        print(wordtoguess.count)
        dashes.remove(at: 0)//remove initial space
        let stringdashes = dashes.joined(separator: " ")
        displayedWord.text = stringdashes
        print(stringdashes)
        
        letterArray = wordtoguess.map {
            String($0) //array of letters in word to guess
        }
        
        
    }
    
//LETTERS
    //A
    @IBAction func A(_ sender: Any) {
        letterA.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "a"{
                dashes[j] = "a"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("a"){ //if user guesses letter correctly
            
            guessedLetters.append("a") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            //let list = guessedLetters.joined(separator: " ") //string of array seperated by comma to display
            
            let indexofletterguessed = letterArray.firstIndex(of: "a")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "a"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            }
            
        else{ //if user guesses incorrectly
            guessedLetters.append("a")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    //B
    @IBAction func B(_ sender: Any) {
        letterB.isHidden = true
        print(letterArray)
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "b"{
                dashes[j] = "b"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("b"){ //if user guesses letter correctly
            
            guessedLetters.append("b") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "b")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "b"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("b")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
        
            }
    
    //C
    @IBAction func C(_ sender: Any) {
        letterC.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "c"{
                dashes[j] = "c"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("c"){ //if user guesses letter correctly
            
            guessedLetters.append("c") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "c")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "c"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("c")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //D
    @IBAction func D(_ sender: Any) {
        letterD.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "d"{
                dashes[j] = "d"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("d"){ //if user guesses letter correctly
            
            guessedLetters.append("d") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "d")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "d"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("d")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    //E
    @IBAction func E(_ sender: Any) {
        letterE.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "e"{
                dashes[j] = "e"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("e"){ //if user guesses letter correctly
            
            guessedLetters.append("e") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "e")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "e"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("e")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //F
    @IBAction func F(_ sender: Any) {
        letterF.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "f"{
                dashes[j] = "f"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("f"){ //if user guesses letter correctly
            
            guessedLetters.append("f") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "f")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "f"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("f")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //G
    @IBAction func G(_ sender: Any) {
        letterG.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "g"{
                dashes[j] = "g"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("g"){ //if user guesses letter correctly
            
            guessedLetters.append("g") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "g")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "g"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("g")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //H
    @IBAction func H(_ sender: Any) {
        letterH.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "h"{
                dashes[j] = "h"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("h"){ //if user guesses letter correctly
            
            guessedLetters.append("h") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "h")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "h"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("h")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //I
    @IBAction func I(_ sender: Any) {
        letterI.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "i"{
                dashes[j] = "i"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("i"){ //if user guesses letter correctly
            
            guessedLetters.append("i") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "i")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "i"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("i")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //J
    @IBAction func J(_ sender: Any) {
        letterJ.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "j"{
                dashes[j] = "j"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("j"){ //if user guesses letter correctly
            
            guessedLetters.append("j") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "j")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "j"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("j")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //K
    @IBAction func K(_ sender: Any) {
        letterK.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "k"{
                dashes[j] = "k"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("k"){ //if user guesses letter correctly
            
            guessedLetters.append("k") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "k")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "k"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("k")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //L
    @IBAction func L(_ sender: Any) {
        letterL.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "l"{
                dashes[j] = "l"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("l"){ //if user guesses letter correctly
            
            guessedLetters.append("l") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "l")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "l"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("l")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //M
    @IBAction func M(_ sender: Any) {
        letterM.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "m"{
                dashes[j] = "m"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("m"){ //if user guesses letter correctly
            
            guessedLetters.append("m") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "m")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "m"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("m")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //N
    @IBAction func N(_ sender: Any) {
        letterN.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "n"{
                dashes[j] = "n"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("n"){ //if user guesses letter correctly
            
            guessedLetters.append("n") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "n")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "n"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("n")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //O
    @IBAction func O(_ sender: Any) {
        letterO.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "o"{
                dashes[j] = "o"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("o"){ //if user guesses letter correctly
            
            guessedLetters.append("o") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "o")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "o"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("o")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //P
    @IBAction func P(_ sender: Any) {
        letterP.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "p"{
                dashes[j] = "p"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("p"){ //if user guesses letter correctly
            
            guessedLetters.append("p") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "p")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "p"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("p")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //Q
    @IBAction func Q(_ sender: Any) {
        letterQ.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "q"{
                dashes[j] = "q"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("q"){ //if user guesses letter correctly
            
            guessedLetters.append("q") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "q")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "q"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("q")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //R
    @IBAction func R(_ sender: Any) {
        letterR.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "r"{
                dashes[j] = "r"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("r"){ //if user guesses letter correctly
            
            guessedLetters.append("r") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "r")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "r"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("r")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    //S
    @IBAction func S(_ sender: Any) {
        letterS.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "s"{
                dashes[j] = "s"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("s"){ //if user guesses letter correctly
            
            guessedLetters.append("s") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "s")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "s"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("s")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //T
    @IBAction func T(_ sender: Any) {
        letterT.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "t"{
                dashes[j] = "t"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("t"){ //if user guesses letter correctly
            
            guessedLetters.append("t") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "t")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "t"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("t")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //U
    @IBAction func U(_ sender: Any) {
        letterU.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "u"{
                dashes[j] = "u"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("u"){ //if user guesses letter correctly
            
            guessedLetters.append("u") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "u")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "u"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("u")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //V
    @IBAction func V(_ sender: Any) {
        letterV.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "v"{
                dashes[j] = "v"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("v"){ //if user guesses letter correctly
            
            guessedLetters.append("v") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "i")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "i"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("v")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //W
    @IBAction func W(_ sender: Any) {
        letterW.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "w"{
                dashes[j] = "w"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("w"){ //if user guesses letter correctly
            
            guessedLetters.append("w") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "w")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "w"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("w")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //X
    @IBAction func X(_ sender: Any) {
        letterX.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "x"{
                dashes[j] = "x"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("x"){ //if user guesses letter correctly
            
            guessedLetters.append("x") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "x")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "x"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("x")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //Y
    @IBAction func Y(_ sender: Any) {
        letterY.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "y"{
                dashes[j] = "y"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("y"){ //if user guesses letter correctly
            
            guessedLetters.append("y") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "y")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "y"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("y")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
    
    //Z
    @IBAction func Z(_ sender: Any) {
        letterZ.isHidden = true
        if guessedLetters[0] == "" {
            guessedLetters.remove(at: 0) //remove first value from array if it is still an empty space
        }
        //check for repeated letters
        var j = 0
        while j <= (wordtoguess.count - 1){
            let letter = letterArray[j]
            if letter == "z"{
                dashes[j] = "z"
                let stringdashes = dashes.joined(separator: " ")
                displayedWord.text = stringdashes
            }
            j += 1
        }
        
        if letterArray.contains("z"){ //if user guesses letter correctly
            
            guessedLetters.append("z") //add guessed letter to array of guessed letters
            
            print(guessedLetters)
            
            let indexofletterguessed = letterArray.firstIndex(of: "z")
            print(indexofletterguessed!)
            
            dashes[indexofletterguessed!] = "z"
            let stringdashes = dashes.joined(separator: " ")
            displayedWord.text = stringdashes
            
            if !(stringdashes.contains("_")){
                winorlose.text = "YOU WIN!"
                hangmanimage.image = UIImage(named: "yay")
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
            
            
            }
            
        
        else{ //if user guesses incorrectly
            guessedLetters.append("z")
            print(guessedLetters)
            
            hangmanimage.image = UIImage(named: "Hangman\(i)")
            i += 1 //adds one to number of errors
            if i == 10 { //runs out of guesses
                winorlose.text = "YOU LOSE! The word was \(wordtoguess)"
                displayTrans.text = translatedword //translation shown
                translationLabel.text = "Translation to spanish:"
            }
        }
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


