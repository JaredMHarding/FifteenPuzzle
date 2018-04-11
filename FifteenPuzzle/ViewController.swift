//
//  ViewController.swift
//  FifteenPuzzle
//
//  Created by Jared Micheal Harding on 4/11/18.
//  Copyright © 2018 Jared Micheal Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func tileSelected(_ sender: UIButton) {
        
    }
    
    @IBAction func shuffleTiles(_ sender: AnyObject) {
        
    }
}

