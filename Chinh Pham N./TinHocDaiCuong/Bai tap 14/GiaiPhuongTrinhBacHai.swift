//
//  GiaiPhuongTrinhBacHai.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct GiaiPhuongTrinhBacHai {
    func tinhPtB2(_ a: Float, _ b: Float, _ c: Float) {
        var delta: Float = 0.0
        
        delta = b * b - 4 * a * c
        
        if delta < 0 {
            print("Phương trình vô nghiệm!")
        } else if delta == 0 {
            print("Phương trình có nghiệm kép X1, X2: \(-b / (2 * a))")
        } else {
            print("Phương trình có hai nghiệm phân biệt:\nX1 = \((-b + sqrt(delta)) / (2 * a))\nX2 = \((-b - sqrt(delta)) / (2 * a))")
        }
    }
    
    func display() {
        print("Giải phương trình bậc hai: AX^2 + BX + C = 0")
        
        print("Nhập hệ số A:")
        let a = readLine()
        
        print("Nhập hệ số B:")
        let b = readLine()
        
        print("Nhập hệ số C:")
        let c = readLine()
        
        if let valueA = a as NSString?, let valueB = b as NSString?, let valueC = c as NSString? {
            tinhPtB2(valueA.floatValue, valueB.floatValue, valueC.floatValue)
        }
    }
}
