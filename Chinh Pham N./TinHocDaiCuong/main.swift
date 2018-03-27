//
//  main.swift
//  TinHocDaiCuong
//
//  Created by Chinh Pham N. on 3/27/18.
//  Copyright © 2018 Chính Phạm. All rights reserved.
//

import Foundation

/*
 Menu exercise
*/

var isExit: Bool = false

repeat {
    print("-----------------------------------------\n* Bài 12 (Bài tập làm thêm)")
    print("-----------------------------------------\nNhập bài tập muốn xem (1..n), 0 -> Thoát:")
    let choice = readLine()
    if let value = choice as NSString? {
        switch(value.intValue) {
        case 0:
            isExit = !isExit
        case 1:
            let bt1 = BanhKinhHinhCau()
            bt1.display()
            
        case 2:
            let bt2 = TinhGiaTriHam()
            bt2.display()
            
        case 3:
            let bt3 = GiaTriFXY()
            bt3.display()
            
        case 4:
            let bt4 = ChuKyCuaConLac()
            bt4.display()
            
        case 5:
            let bt5 = DienTichTamGiac()
            bt5.display()
            
        case 6:
            let bt6 = BieuThuc()
            bt6.display()
            
        case 7:
            let bt7 = BieuThucCos()
            bt7.display()
            
        case 8:
            let bt8 = BieuThucSin()
            bt8.display()
            
        case 9:
            let bt9 = BieuThucLog()
            bt9.display()
            
        case 10:
            let bt10 = BieuThucExp()
            bt10.display()
            
        case 11:
            let bt11 = BieuThucExp2()
            bt11.display()
            
        case 12:
            let bt12 = TinhGiaTriLonNhat()
            bt12.display()
            
        case 13:
            let bt13 = LenhDieuKien()
            bt13.display()
            
        case 14:
            let bt14 = GiaiPhuongTrinhBacHai()
            bt14.display()
            
        case 15:
            let bt15 = GiaiBatPhuongTrinhBacHai()
            bt15.display()
            
        default:
            print("Không tìm thấy bài tập!")
        }
    }
} while(!isExit)

