//
//  LenhDieuKien.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct LenhDieuKien {
    func tinhDinhThuc(_ a: Float, _ b: Float, _ c: Float, _ d: Float, _ e: Float, _ f: Float) {
        var dinhthuc: Float = 0.0
        var dx: Float = 0.0
        var dy: Float = 0.0
        dinhthuc = a * e - d * b
        dx = c * e - f * b
        dy = a * f - d * c
        
        if dinhthuc != 0 {
            print("Nghiệm X = \(dx/dinhthuc)")
            print("Nghiệm Y = \(dy/dinhthuc)")
        } else if dx != 0 {
            print("Hệ phương trình vô nghiệm!")
        } else {
            print("Hệ phương trình vô định!")
        }
        
    }
    
    func display() {
        print("Nhập A:")
        let a = readLine()
        
        print("Nhập B:")
        let b = readLine()
        
        print("Nhập C:")
        let c = readLine()
        
        print("Nhập D:")
        let d = readLine()
        
        print("Nhập E:")
        let e = readLine()
        
        print("Nhập F:")
        let f = readLine()
        
        if let valueA = a as NSString?, let valueB = b as NSString?, let valueC = c as NSString?, let valueD = d as NSString?, let valueE = e as NSString?, let valueF = f as NSString? {
            tinhDinhThuc(valueA.floatValue, valueB.floatValue, valueC.floatValue, valueD.floatValue, valueE.floatValue, valueF.floatValue)
        }
    }
}
