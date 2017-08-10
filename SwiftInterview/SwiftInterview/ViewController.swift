//
//  ViewController.swift
//  SwiftInterview
//
//  Created by xubojoy on 2017/8/8.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit

class DailyMeal{
    enum MealTime
    {
        case Breakfast
        case Lunch
        case Dinner
    }
    var meals: [MealTime : String] = [:]
    
    //22222
    subscript(requestedMeal : MealTime) -> String? {
        get{
            if let thisMeals = meals[requestedMeal]{
                return thisMeals
            }else{
                return "Ramen"
            }
        }
        set(newMealName){
            meals[requestedMeal] = newMealName
        }
    }
}

class ViewController: UIViewController {
    struct Person {
        let name : String
        let money : String
    }
    struct Matrix {
        let rows: Int, columns: Int
        var grid: [Double]
        init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns
            grid = Array(repeating: 0.0, count: rows * columns)
        }
        func indexIsValid(row: Int, column: Int) -> Bool {
            return row >= 0 && row < rows && column >= 0 && column < columns
        }
        subscript(row: Int, column: Int) -> Double {
            get {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                return grid[(row * columns) + column]
            }
            set {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                grid[(row * columns) + column] = newValue
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        
        let a = Person(name: "小王", money: "5.0")
        let b = Person(name: "小李", money: "7.0")
        let c = Person(name: "小张", money: "5.0")
        
        let sumMoney = [a, b , c].reduce(0) {
            return $0 + ($1.money as NSString).doubleValue
        }
        
        print(sumMoney)
        
        print(min(10, b: 20))
        HGLog("程序启动")
        print("adfsdfdgas".characters.count)
        
        do {
            print("走这儿了11111")
            try throwfunc2()
        } catch  {
            print("走这儿了2222")
        }
        
        
        typealias noReturn = (String) -> Void
        
        
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        btn.setTitle("测试", for: .normal)
        btn.backgroundColor = .purple
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(btn)
        
        var matrix = Matrix(rows: 2, columns: 2)
        matrix.grid = [1.0,2.0,3.0,4.0]
        print(matrix)
        
//        11111
        let monday = DailyMeal()
        monday.meals[.Breakfast] = "Toast"
        if let someMeal = monday.meals[.Breakfast]{
            print(someMeal)
        }
        
//        22222
//        let monday = DailyMeal()
//        monday[.Breakfast] = "Toast"
//        if let someMeal = monday[.Breakfast]{
//            print(someMeal)
//        }
        
        
        let d:Int? = 0
        let e = 4
        print((d ?? 0) + e)
        
        
        
        let array = ["A", "B", "C", "D"]
//        let slicedArray = array[1...3] //【 B C D 】
        let slicedArray = array[1..<3] //【 B C 】
        print(slicedArray.count,slicedArray) // 2
//        print(slicedArray[0]) // error
        print(slicedArray.startIndex,slicedArray.endIndex)
    
    }
    
    
    func btnClick() {
        let nextvc = NextViewController()
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    
    
    func HGLog<T>(_ message:T, file:String = #file, function:String = #function,
               line:Int = #line) {
        #if DEBUG
            //获取文件名
            let fileName = (file as NSString).lastPathComponent
            //打印日志内容
            print("\(fileName):\(line) \(function) | \(message)")
        #endif
    }
    
    final func min<T : Comparable>(_ a : T,b : T) -> T {
        return a < b ? a : b
    }

    func throwfunc1() throws {
        
    }
    
    func throwfunc2() throws {
        try throwfunc1()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



protocol StringType {}

extension String: StringType{}

extension Set where Element: StringType{
    func hello() {
        
    }
}






