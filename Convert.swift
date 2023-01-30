//
//  Convert.swift
//  Timer
//
//  Created by Fouad Shalaby on 2022-08-29.
//

import Foundation

func convert (time: Int) -> String
{
    let min = time/60
    let sec = time
    return String(format: "%02i:%02i", min , sec)
}

