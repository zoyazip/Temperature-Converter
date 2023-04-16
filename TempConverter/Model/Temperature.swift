//
//  Temperature.swift
//  TempConverter
//
//  Created by d.chernov on 16/04/2023.
//

import Foundation

struct Temperature{
    let celsius: Int?
    
    func getFahrenheit() -> Int{
        return Int((celsius! * 9 / 5) + 32)
    }
    func getKelvin() -> Int{
        return Int(Double(celsius!) + 273.15)
    }
}
