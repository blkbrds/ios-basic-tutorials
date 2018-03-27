//
//  BieuThucLog.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct BieuThucLog {
    func tinhX(_ x: Float) -> Float {
        return 1 + log(x * x)
    }
    
    func display() {
        print("Nhập X:")
        let x = readLine()
        if let value = x as NSString? {
            print("Kết quả là = \(tinhX(value.floatValue))")
        }
    }
}
