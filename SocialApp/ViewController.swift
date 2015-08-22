import UIKit
import Social
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func selectImage(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = 
            UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as NSString]
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, 
            completion: nil)

    }
    
    @IBAction func sendPost(sender: AnyObject) {
        var activityItems: [AnyObject]?
        let image = postImage.image

        if (postImage.image != nil) {
            activityItems = [postText.text, postImage.image!]
        } else {
            activityItems = [postText.text]
        }

        let activityController = UIActivityViewController(activityItems: 
            activityItems!, applicationActivities: nil)
        self.presentViewController(activityController, animated: true, 
            completion: nil)

    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        postText.endEditing(true)
    }

    func imagePickerController(picker: UIImagePickerController, 
       didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.dismissViewControllerAnimated(true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        postImage.image = image
    }

    func imagePickerControllerDidCancel(picker: 
        UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

