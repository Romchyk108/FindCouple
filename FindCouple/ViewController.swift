//
//  ViewController.swift
//  FindCouple
//
//  Created by Roman Shestopal on 11.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnNewGameOutlet: UIButton!
    @IBOutlet weak var btnContinueOutlet: UIButton!
    @IBOutlet weak var levelSegmentOutlet: UISegmentedControl!
    @IBOutlet weak var levelLabelOutlet: UILabel!

    static var numberImages: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseLevel(segment: levelSegmentOutlet)
        
    }
    
    func chooseLevel(segment: UISegmentedControl){
        let prefix: String = "Level of difficulty: "
        switch segment.selectedSegmentIndex {
        case 0:
            levelLabelOutlet.text = prefix + "very easy"
        case 1:
            levelLabelOutlet.text = prefix + "easy"
        case 2:
            levelLabelOutlet.text = prefix + "middle"
        case 3:
            levelLabelOutlet.text = prefix + "little hard"
        case 4:
            levelLabelOutlet.text = prefix + "hard"
        default:
            levelLabelOutlet.text = prefix + "expert"
        }
        ViewController.numberImages = segment.selectedSegmentIndex + 4
    }

    @IBAction func tapNewGame(_ sender: UIButton) {
//        let vc: SecondViewController = SecondViewController()
//        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func tapContinue(_ sender: UIButton) {
//        let vc = SecondViewController()
//        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func actionLevelSegment(_ sender: UISegmentedControl) {
        chooseLevel(segment: sender)
        ViewController.numberImages = Int(levelSegmentOutlet.selectedSegmentIndex + 4)
        print("numberImages - \(ViewController.numberImages)")
    }
    
}

