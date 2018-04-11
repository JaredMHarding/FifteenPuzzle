//
//  FifteenBoard.swift
//  FifteenPuzzle
//
//  Created by Jared Micheal Harding on 4/11/18.
//  Copyright © 2018 Jared Micheal Harding. All rights reserved.
//

import Foundation

class FifteenBoard {
    var state : [[Int]] = [
        [1,2,3,4],
        [5,6,7,8],
        [9,10,11,12],
        [13,14,15,0]
    ]
    
    // MARK: Methods
    func scramble(numTimes n: Int) {
        
    }
    
    func getTile() -> Int {
        
    }
    
    func getRowAndColumn(forTile tile: Int) -> (row: Int, column: Int) {
        
    }
    
    func isSolved() -> Bool {
        
    }
    
    func canSlideTileUp(atRow r : Int, Column c : Int) -> Bool {
        
    }
    
    func canSlideTileDown(atRow r : Int, Column c : Int) -> Bool {
        
    }
    
    func canSlideTileLeft(atRow r : Int, Column c : Int) -> Bool {
        
    }
    
    func canSlideTileRight(atRow r : Int, Column c : Int) -> Bool {
        
    }
    func canSlideTile(atRow r : Int, Column c : Int) -> Bool {
        
    }
    func slideTile(atRow r : Int, Column c: Int) {
        
    }
}
