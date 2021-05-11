//
//  VideoWorkout.swift
//  FITness
//
//
//

import UIKit
import WebKit

class VideoWorkout: UIViewController {
    
    @IBOutlet var videoView: WKWebView!
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "returnToVideos", sender: self)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoURL = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        let request: URLRequest = URLRequest(url: videoURL!)
        videoView.load(request)

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
