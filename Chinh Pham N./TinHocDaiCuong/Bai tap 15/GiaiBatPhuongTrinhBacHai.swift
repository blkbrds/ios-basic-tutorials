//
//  GiaiBatPhuongTrinhBacHai.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation
import Darwin


struct GiaiBatPhuongTrinhBacHai {
    func tinhPtB2(_ a: Float, _ b: Float, _ c: Float) {
        var delta: Float = 0.0
        var x1: Float = 0.0
        var x2: Float = 0.0
        
        if a == 0 && b == 0 && c == 0 {
            print("Vui lòng nhập lại các hệ số A, B, C")
        } else if a == 0 {
            if b == 0 {
                print("Không phải là bất phương trình, vui lòng nhập lại!")
            } else {
                print("Nghiệm của bất phương trình \((b > 0 ? ">" : b < 0 ? "<" : "" )) \(-c / b)")
            }
        }
        
        if a > 0 {
            delta = b * b - a * a * c
            if delta <= 0 {
                print("Bất phương trình đúng với mọi X")
            }
            
            if delta > 0 {
                x1 = (-b - sqrt(delta)) / (2 * a)
                x2 = (-b + sqrt(delta)) / (2 * a)
                
                print("Nghiệm của bất phương trình X < \(x1) hoặc X > \(x2)")
            }
        }
        
        if a < 0 {
            delta = b * b - 4 * a * c
            if delta <= 0 {
                print("Bất phương trình vô nghiệm!")
            }
            
            if delta > 0 {
                x1 = (-b - sqrt(delta)) / (2 * a)
                x2 = (-b + sqrt(delta)) / (2 * a)
                
                print("Nghiệm của bất phương trình X > \(x2) và X < \(x1)")
            }
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
