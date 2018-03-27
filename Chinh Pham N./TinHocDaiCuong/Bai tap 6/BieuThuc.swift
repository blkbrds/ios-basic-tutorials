//
//  BieuThuc.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct BieuThuc {
    func tinhBieuThuc(_ x: Float) -> Float {
        var s: Float = 0.0
        s = (9 * x * x + 15) / (7 * sqrt(x * x))
        return s
    }
    
    func display() {
        print("Nhập X:")
        let x = readLine()
        
        if let value = x as NSString? {
            print("Kết quả tính là = \(tinhBieuThuc(value.floatValue))")
        }
    }
}
