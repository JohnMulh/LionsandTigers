//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by John Mulholland on 10/11/2014.
//  Copyright (c) 2014 John Mulholland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
// fields on the UIView


    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    
// Set up empty array to hold instances of tiger using the Tigers struct
    
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    
// variable to store array iddex
     var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
// set up first instances of Tiger
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "BengalTiger"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
// call function to adjust tiger age in this first instance of Tiger
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
// append first instance of Tiger in MyTigers array i.e first one
    
        myTigers.append(myTiger)
        
        println("My tiger's name is \(myTiger.name) its age is \(myTiger.age) and the breed is \(myTiger.breed) and its picture is \(myTiger.image)")
// set UIView fields to first instance of tiger
        
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.myImageView.image = myTiger.image
        self.randomFactLabel.text = myTiger.randomFact()
        
        
// call chuff function set up in struct
//        myTiger.chuff()
        
// set up second through fourth instances of Tiger
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.age = 2
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        secondTiger.age = myTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.age = 4
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        thirdTiger.age = myTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.age = 5
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        fourthTiger.age = myTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
// add last three instances of the Tiger to the myTigers array
        myTigers += [secondTiger, thirdTiger, fourthTiger]

// create instances of lion and populate  with values
        
        var lion = Lion ()
        lion.isAlphaMale = false
        lion.image = UIImage(named:"Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        lion.roar()
        lioness.roar()
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)

        self.lions += [lion, lioness]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItem(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
        
    }
    
    func updateAnimal ()
    {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    func updateView ()
    {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.randomFactLabel.text = tiger.randomFact()
                
            }
                
            else if self.currentAnimal.species == "Lion" {
                    let lion = self.lions[self.currentAnimal.index]
                    self.myImageView.image = lion.image
                    self.breedLabel.text = lion.subspecies
                    self.nameLabel.text = lion.name
                    self.ageLabel.text = "\(lion.age)"
                    self.randomFactLabel.text = lion.randomFact()
                }
            
            self.randomFactLabel.hidden = false
            
            }, completion: {
                (finished: Bool) -> () in
        })

    }
}