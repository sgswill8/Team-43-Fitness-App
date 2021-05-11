//
//  TimedWorkout.swift
//  FITness
//
//
//

import UIKit

class TimedWorkout: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    var toFinish = false
    var setsDone = 0
    var setsLeft = sets
    
    var timer = Timer()
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var setsCompleted: UILabel!
    
    @IBOutlet var setsRemaining: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "returnToChoice", sender: self)
    }
    
    @IBAction func finishButton(_ sender: Any) {
        if (toFinish == true) {
            timer.invalidate()
            performSegue(withIdentifier: "returnToChoice", sender: self)
        }
        else if (toFinish == false) {
            stopButton.backgroundColor = nil
            stopButton.setTitle("", for: .normal)
            toFinish = true
            
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            
            basicAnimation.toValue = 1
            
            basicAnimation.duration = Double(workoutTime * 60)
            
            basicAnimation.fillMode = .forwards
            basicAnimation.isRemovedOnCompletion = false
            
            shapeLayer.add(basicAnimation, forKey: "randomKey")
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimedWorkout.counter), userInfo: nil, repeats: true)
        }
    }
    
    var seconds = workoutTime * 60
    
    @objc func counter() {
        seconds = seconds - 1
        if (seconds > 60) {
            if (seconds % 60 == 0) {
                workoutTime = workoutTime - 1
                timeRemaining.text = "0\(workoutTime):00"
                setsDone = setsDone + 1
                setsLeft = setsLeft - 1
                setsCompleted.text = "\(setsDone)"
                setsRemaining.text = "\(setsLeft)"
            }
            else
            {
                if (seconds % 60 < 10) {
                    timeRemaining.text = "0\(workoutTime - 1):0\(seconds % 60)"
                }
                else {
                    timeRemaining.text = "0\(workoutTime - 1):\(seconds % 60)"
                }
            }
        }
        else if (seconds > 0) {
            if (seconds < 10) {
                timeRemaining.text = "00:0\(seconds)"
            }
            else
            {
                timeRemaining.text = "00:\(seconds)"
        
            }
        }
        
        if (seconds == 0) {
            timeRemaining.text = "00:00"
            timer.invalidate()
        }
    }
    
    @IBOutlet var timeRemaining: UILabel!
    
    @IBOutlet var stopButton: UIButton!
    
    
    
    @IBAction func beginButton(_ sender: Any) {
        
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        basicAnimation.duration = Double(workoutTime * 60)
        
        shapeLayer.add(basicAnimation, forKey: "randomKey")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setsDone = 0
        setsLeft = sets
        toFinish = false
        if (workoutTime < 10) {
            timeLabel.text = "0\(workoutTime):00"
        }
        else
        {
            timeLabel.text = "\(workoutTime):00"
        }
        setsCompleted.text = "0"
        setsRemaining.text = "\(sets)"
        
        stopButton.backgroundColor = UIColor.black
        stopButton.setTitle("Start", for: .normal)
        stopButton.setTitleColor(UIColor.white, for: .normal)
        stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        
        //let shapeLayer = CAShapeLayer()
        let center = CGPoint(x: view.center.x, y: view.center.y + 120)

        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 150, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
        
        
        //let center = CGPoint(x: view.center.x, y: view.center.y)
        //let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
