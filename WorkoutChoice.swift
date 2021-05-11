//
//  WorkoutChoice.swift
//  FITness
//
//
//

import UIKit

var reps: Int = 0
var sets: Int = 0
var workoutTime = 0
var videoCode = ""

class WorkoutChoice: UIViewController {
    
    var filter = ""
    
    @IBOutlet var absImage: UIImageView!
    
    @IBOutlet var aerobicsImage: UIImageView!
    
    @IBOutlet var armsImage: UIImageView!
    
    @IBOutlet var backImage: UIImageView!
    
    @IBOutlet var hiitImage: UIImageView!
    
    @IBOutlet var legsImage: UIImageView!
    
    @IBOutlet var pilatesImage: UIImageView!
    
    @IBOutlet var warmUpImage: UIImageView!
    
    @IBAction func video1(_ sender: Any) {
        videoCode = "06SW69PYAXI"
        performSegue(withIdentifier: "toVideo", sender: self)
    }
    
    @IBAction func video2(_ sender: Any) {
        videoCode = "a44ayeoSfKM"
        performSegue(withIdentifier: "toVideo", sender: self)
    }
    
    @IBAction func video3(_ sender: Any) {
        videoCode = "AzXouAU1y0Y"
        performSegue(withIdentifier: "toVideo", sender: self)
    }
    
    @IBAction func video4(_ sender: Any) {
        videoCode = "zVjKoDJT8pc"
        performSegue(withIdentifier: "toVideo", sender: self)
    }
    
    @IBAction func video5(_ sender: Any) {
        videoCode = "Zrs4LhEblrI"
        performSegue(withIdentifier: "toVideo", sender: self)
    }
    
    @IBAction func video6(_ sender: Any) {
        videoCode = "8JZANbfvywI"
        performSegue(withIdentifier: "toVideo", sender: self)
    }
    
    @IBAction func video7(_ sender: Any) {
        videoCode = "r0jxM7oo0Xg"
        performSegue(withIdentifier: "toVideo", sender: self)
    }
    
    @IBAction func video8(_ sender: Any) {
        videoCode = "oLu9kwDzBdg"
        performSegue(withIdentifier: "toVideo", sender: self)
    }
    
    
    @IBAction func filterButton(_ sender: Any) {
        filterText.isHidden = false
        applyButton.isHidden = false
    }
    
    @IBOutlet var filterText: UITextField!
    
    @IBAction func applyFilter(_ sender: Any) {
        filterText.resignFirstResponder()
        filter = filterText.text!
        filter = filter.lowercased()
        switch (filter) {
        case "abs":
            absImage.isHidden = false
            aerobicsImage.isHidden = true
            armsImage.isHidden = true
            backImage.isHidden = true
            hiitImage.isHidden = true
            legsImage.isHidden = true
            pilatesImage.isHidden = true
            warmUpImage.isHidden = true
        case "arms":
            absImage.isHidden = true
            aerobicsImage.isHidden = true
            armsImage.isHidden = false
            backImage.isHidden = true
            hiitImage.isHidden = true
            legsImage.isHidden = true
            pilatesImage.isHidden = true
            warmUpImage.isHidden = true
        case "back":
            absImage.isHidden = true
            aerobicsImage.isHidden = true
            armsImage.isHidden = true
            backImage.isHidden = false
            hiitImage.isHidden = true
            legsImage.isHidden = true
            pilatesImage.isHidden = true
            warmUpImage.isHidden = true
        case "legs":
            absImage.isHidden = true
            aerobicsImage.isHidden = true
            armsImage.isHidden = true
            backImage.isHidden = true
            hiitImage.isHidden = true
            legsImage.isHidden = false
            pilatesImage.isHidden = true
            warmUpImage.isHidden = true
        case "pilates":
            absImage.isHidden = true
            aerobicsImage.isHidden = true
            armsImage.isHidden = true
            backImage.isHidden = false
            hiitImage.isHidden = true
            legsImage.isHidden = true
            pilatesImage.isHidden = false
            warmUpImage.isHidden = true
        default:
            absImage.isHidden = false
            aerobicsImage.isHidden = false
            armsImage.isHidden = false
            backImage.isHidden = false
            hiitImage.isHidden = false
            legsImage.isHidden = false
            pilatesImage.isHidden = false
            warmUpImage.isHidden = false
        }
    }
    
    @IBOutlet var applyButton: UIButton!
    
    @IBOutlet var repsText: UITextField!
    
    @IBOutlet var setsText: UITextField!
    
    @IBAction func workoutStart(_ sender: Any) {
        var repsString = repsText.text!
        var setsString = setsText.text!
        reps = Int(repsString)!
        sets = Int(setsString)!
        workoutTime = ((reps * 5) * sets) / 60
        //print(workoutTime)
        performSegue(withIdentifier: "toTimedWorkout", sender: self)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterText.isHidden = true
        applyButton.isHidden = true

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
