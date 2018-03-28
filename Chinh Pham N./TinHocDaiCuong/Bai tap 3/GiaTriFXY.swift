//
//  GiaTriFXY.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct GiaTriFXY {
    func tinhGiaTriFXY(x: Float, y: Float) -> Float {
        var tu: Float = 0.0
        var mau: Float = 0.0
        
        tu = pow(5, x) + log((fabs(x - y))) / log(5)
        mau = 1 + atan(x + y)
        
        return tu/mau
    }
    
    func display() {
        print("Nhập giá trị X:")
        let x = readLine()
        
        print("Nhập giá trị Y:")
        let y = readLine()
        
        if let valueX = x as NSString?, let valueY = y as NSString? {
            print("Kết quả của F = \(String(tinhGiaTriFXY(x: valueX.floatValue, y: valueY.floatValue)))")
        }
    }
}
