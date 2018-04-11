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
    
    func getTile(atRow r: Int, atColumn c: Int) -> Int {
        return state[r][c]
    }
    
    func getRowAndColumn(forTile tile: Int) -> (row: Int, column: Int)? {
        if ((tile < 0) || (tile > 15)) {
            return nil
        }
        for r in 0 ..< 4 {
            for c in 0 ..< 4 {
                if (state[r][c] == tile) {
                    return (r,c)
                }
            }
        }
        // to make the compiler happy
        return nil
    }
    
    func isSolved() -> Bool {
        var tile = 1
        for r in 0 ..< 4 {
            for c in 0 ..< 4 {
                if (state[r][c] != tile) {
                    return false
                }
                tile = (tile + 1) % 16
            }
        }
        return true
    }
    
    func canSlideTileUp(atRow r : Int, atColumn c : Int) -> Bool {
        return (r >= 1) && (r <= 3) && (state[r-1][c] == 0)
    }
    
    func canSlideTileDown(atRow r : Int, atColumn c : Int) -> Bool {
        return (r >= 0) && (r <= 2) && (state[r+1][c] == 0)
    }
    
    func canSlideTileLeft(atRow r : Int, atColumn c : Int) -> Bool {
        return (c >= 1) && (c <= 3) && (state[r][c-1] == 0)
    }
    
    func canSlideTileRight(atRow r : Int, atColumn c : Int) -> Bool {
        return (c >= 0) && (c <= 2) && (state[r][c+1] == 0)
    }
    /*
    func canSlideTile(atRow r : Int, atColumn c : Int) -> Bool {
        return (
            canSlideTileUp(atRow:r,atColumn:c) ||
            canSlideTileDown(atRow:r,atColumn:c) ||
            canSlideTileLeft(atRow:r,atColumn:c) ||
            canSlideTileRight(atRow:r,atColumn:c)
        )
    }
    */
    func slideTile(atRow r : Int, atColumn c: Int) {
        
    }
}
