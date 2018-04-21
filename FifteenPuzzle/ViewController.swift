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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board
        let pos = board!.getRowAndColumn(forTile: sender.tag)
        let buttonBounds = sender.bounds
        var buttonCenter = sender.center
        var slide = true
        if board!.canSlideTileUp(atRow: pos!.row, atColumn: pos!.column) {
            buttonCenter.y -= buttonBounds.size.height
        } else if board!.canSlideTileDown(atRow: pos!.row, atColumn: pos!.column) {
            buttonCenter.y += buttonBounds.size.height
        } else if board!.canSlideTileLeft(atRow: pos!.row, atColumn: pos!.column) {
            buttonCenter.x -= buttonBounds.size.width
        } else if board!.canSlideTileRight(atRow: pos!.row, atColumn: pos!.column) {
            buttonCenter.x += buttonBounds.size.width
        } else {
            slide = false
        }
        if slide {
            if (board!.slideTile(atRow: pos!.row, atColumn: pos!.column)) {
                UIView.animate(withDuration: 0.4, animations:
                    { sender.center = buttonCenter }
                )
                if (board!.isSolved()) {
                    let numMoves = String(board!.numMoves)
                    let alert = UIAlertController(title: "You won!", message: "You completed the puzzle in \(numMoves) moves.", preferredStyle: .actionSheet)
                    let alertAction = UIAlertAction(title: "Play Again?", style: .default, handler: {
                        action in
                        board!.scramble(numTimes: appDelegate.numShuffles)
                        self.boardView.setNeedsLayout()
                    })
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            self.boardView.setNeedsLayout()
        }
    }
    
    @IBAction func shuffleTiles(_ sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let board = appDelegate.board!
        board.scramble(numTimes: appDelegate.numShuffles)
        self.boardView.setNeedsLayout()
    }
}
