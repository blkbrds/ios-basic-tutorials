//
//  TinhGiaTriHam.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct TinhGiaTriHam {
    func tinhGiaTriHam(x: Float, y: Float) -> Float {
        var tu: Float = 0.0
        var mau: Float = 0.0
        var f: Float = 0.0
        
        tu = log(fabs(x * x - y * y)) / log(5) + atan(x + y)
        mau = exp(x) + cos(x + y)
        f = tu / mau
        
        return f
    }
    
    func display() {
        print("Nhập X = ")
        let x = readLine()
        
        print("Nhập Y = ")
        let y = readLine()
        
        if let valueX = x as NSString?, let valueY = y as NSString? {
            print("Kết quả của hàm F(x,y) là = \(tinhGiaTriHam(x: valueX.floatValue, y: valueY.floatValue))")
        }
    }
}
