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
    var numMoves = 0
    
    // MARK: Methods
    func scramble(numTimes n: Int) {
        var i = 0
        while (i < n) {
            if let emptyPosition = getRowAndColumn(forTile: 0) {
                let randomNum = arc4random_uniform(4),
                r = emptyPosition.row,
                c = emptyPosition.column
                switch randomNum {
                case 0:
                    if slideTile(atRow: r-1, atColumn: c) {
                        i += 1
                    }
                case 1:
                    if slideTile(atRow: r+1, atColumn: c) {
                        i += 1
                    }
                case 2:
                    if slideTile(atRow: r, atColumn: c-1) {
                        i += 1
                    }
                case 3:
                    if slideTile(atRow: r, atColumn: c+1) {
                        i += 1
                    }
                default:
                    continue
                }
            }
        }
        numMoves = 0
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
        return (r != 0) && (getTile(atRow: r-1, atColumn: c) == 0)
    }
    
    func canSlideTileDown(atRow r : Int, atColumn c : Int) -> Bool {
        return (r != 3) && (getTile(atRow: r+1, atColumn: c) == 0)
    }
    
    func canSlideTileLeft(atRow r : Int, atColumn c : Int) -> Bool {
        return (c != 0) && (getTile(atRow: r, atColumn: c-1) == 0)
    }
    
    func canSlideTileRight(atRow r : Int, atColumn c : Int) -> Bool {
        return (c != 3) && (getTile(atRow: r, atColumn: c+1) == 0)
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
    func slideTile(atRow r : Int, atColumn c: Int) -> Bool {
        if (r < 0) || (r > 3) || (c < 0) || (c > 3) {
            // invalid index
            return false
        }
        let tileToMove = getTile(atRow: r, atColumn: c)
        state[r][c] = 0
        if canSlideTileRight(atRow: r, atColumn: c) {
            state[r][c+1] = tileToMove
        } else if canSlideTileDown(atRow: r, atColumn: c) {
            state[r+1][c] = tileToMove
        } else if canSlideTileUp(atRow: r, atColumn: c) {
            state[r-1][c] = tileToMove
        } else if canSlideTileLeft(atRow: r, atColumn: c) {
            state[r][c-1] = tileToMove
        } else { // if the tile can't move, set the state back to normal and return false
            state[r][c] = tileToMove
            return false
        }
        numMoves += 1
        return true
    }
}
