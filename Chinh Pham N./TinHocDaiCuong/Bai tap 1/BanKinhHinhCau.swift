//
//  BanKinhHinhCau.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin

struct BanhKinhHinhCau {
    func nghiemR(r: Float) -> (S: Float, V: Float) {
        return (4 * Float.pi * r * r, 4 * Float.pi * r * r * r / 3)
    }
    
    func display() {
        print("Nhập bán kính hình cầu R (với R > 0):")
        let nhapR = readLine()
        
        if let valueR = nhapR as NSString? {
            
            let dienTich: Float = nghiemR(r: valueR.floatValue).S
            let theTich: Float = nghiemR(r: valueR.floatValue).V
            
            print("Diện tích của hình cầu là: \(String(dienTich))\nThể tích của hình cầu là: \(String(theTich))")
        }
    }
}
