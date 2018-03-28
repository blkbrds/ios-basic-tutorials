//
//  DienTichTamGiac.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct DienTichTamGiac {
    func tinhDienTichTamGiac(_ a: Float, _ b: Float, _ c: Float) -> Float {
        var p: Float = 0.0
        var s: Float = 0.0
        
        p = (a + b + c) / 2
        s = sqrt(p * (p - a) * (p - b) * (p - c))
        
        return s
    }
    
    func display() {
        print("Nhập a:")
        let a = readLine()
        
        print("Nhập b:")
        let b = readLine()
        
        print("Nhập c:")
        let c = readLine()
        
        
        if let valueA = a as NSString?, let valueB = b as NSString?, let valueC = c as NSString?{
            print("Diện tích của tam giác là = \(String(tinhDienTichTamGiac(valueA.floatValue, valueB.floatValue, valueC.floatValue)))")
        }
    }
}
