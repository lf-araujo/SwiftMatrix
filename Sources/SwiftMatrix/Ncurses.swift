//
//  Ncurses.swift
//  SwiftMatrix
//
//  Created by Mavrick Laakso on 2017-11-04.
//  Copyright © 2017 Mavrick Laakso. All rights reserved.
//

import Foundation
import CNCURSES

var matrix: Matrix?

func initialize() {
    initscr() // init window
    savetty() // save state of terminal
    nonl()    // no newline
    cbreak()  // disable line buffering
    noecho()
    timeout(0)
    leaveok(stdscr, true)
    curs_set(0)
    signal(SIGINT, exit)
    signal(SIGWINCH, refresh)
    matrix = Matrix(columns: COLS, rows: LINES)
    matrix?.animate()
}

func start() {
    while true {
        switch getch() {
        case Int32(UnicodeScalar("q").value):
            endwin()
            Glibc.exit(0)
        default:
            matrix?.animate()
        }
    }
}

func refresh(_ oper: Int32) {
    endwin()
    refresh()
    clear()

    matrix = Matrix(columns: COLS, rows: LINES)
    matrix?.animate()
}

func exit(_ oper: Int32) {
    endwin()
    Glibc.exit(0)
}
