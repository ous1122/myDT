//
//  ViewController.swift
//  Digital Timer
//
//  Created by 김종현 on 2018. 4. 4..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel! //레이블 지정
    @IBOutlet weak var tswit: UISwitch! //스위치는 outlet, function 두개 다 입력해 주어야 작동한다.
    
    var myTimer = Timer() //타이머 지정
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 처음 뜨는 화면
        tswit.setOn(false, animated: true)
        //      처음 나올 화면에 대해 스위치를 끈 상태로 시작한다(false) 그리고 스위치를 작동 가능하게 한다.(animated:true)
    }
    
    @objc func updateTime() {
        let date = Date()
        let formatter = DateFormatter() //날짜입력은 데이터 포메터가 있다.
        formatter.dateFormat = "YYYY년 MM월 dd일 HH시 mm분 ss초 EEEE"
        //                      적어놓은대로 (E는 요일   |   EEE = MON, EEEE = MOMDAY)
        timeLabel.text = formatter.string(from: date)
            //date(from: _)은 문자열에서 날짜 데이터를 생성한다.
    }

    @IBAction func tstart(_ sender: Any) { //스위치는 outlet, function 두개 다 입력해 주어야 작동한다.
        // 스위치 객체에 있어서 같은 스위치에 두가지의 기능을 같이 커넥션 시켜준다.
        if tswit.isOn == true { //켰을 때
            myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        else {
            myTimer.invalidate() //시계를 멈춘다.
            timeLabel.text = "시계가 멈췄다." //시계가 멈췄을 때에 텍스트 지정
        }
        
    }
}

