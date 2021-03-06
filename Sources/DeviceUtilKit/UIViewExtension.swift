//
//  UIViewExtension.swift
//  DeviceUtilKit
//
//  Created by arronpj on 2021/7/29.
//


import UIKit


//App but not test yet.

// A Class handle UI Navigation
public class AppRouterHelper {
    
    /// Acquire UINavigationController's reference.
    /// Shoulde be setup by "setupNC" at "viewDidLoad" in root View Controller.
    var currentNC_ : UINavigationController? = nil
    
    public static let shared: AppRouterHelper = {
        let instance = AppRouterHelper()
        return instance
    }()
    /// Setup function , require UINavigationController
    public func setupNC(_ currentNC: UINavigationController){
        
        if(currentNC_ == nil){
            currentNC_ = currentNC
            self.currentNC_?.navigationBar.tintColor = .white
            self.currentNC_?.navigationBar.barTintColor = .demoDeepBlack
        }
    }
    
    public func openLiveView(){
        //LiveSingleVC
        //let liveVC = AppStoryboard.LiveView.getVC(vcClass: LiveSingleVC.self)
        //self.currentNC_?.pushViewController(liveVC, animated: true)
        
    }
    public func openPlaybackView(){
        
        //self.currentNC_?.pushViewController(forgetPwdVC, animated: true)
    }
}
enum AppStoryboard : String {
    /// SOP01 Define New Storyboard. (adding case)
    case Main = "Main"
    //case LiveView = "LiveView"
    //case PlaybackView = "PlaybackView"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    /// Using UIClass to get UIVC.
    //透過UIClass本身取得該Storyboard當中的該 ViewController Class.
    func getVC(vcClass : UIViewController.Type) -> UIViewController {
        return self.instance.instantiateViewController(withIdentifier: vcClass.storyboardID)
    }
}


//Helper for Navigation, Storyboard , and Keyboard
extension UIViewController {
    
    /// for Storyboard related using
    class var storyboardID : String {
        return "\(self)"
    }
    
    /// Show/Hide NavigationBar
    func showNavigationBar(_ flag:Bool){
        
        if( flag == true){
            self.navigationController?.navigationBar.isHidden = false;
        } else {
            self.navigationController?.navigationBar.isHidden = true;
        }
    }
    
    /// Hide Keyboard
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
// MARK: - Add a UIVC into other UIVC
extension UIViewController {
    
    /// addChildVC : function to add a UIViewController into another UIViewController.
    /// This function could use when ViewDidLoad , setup process
    /// EX: setup UberSignatureVC into my custom VC with self.view as parentView
    /// - Parameters:
    ///   - childVC: the VC inside.
    ///   - toParentView: the VC as container.
    func addChildVC(_ childVC: UIViewController, toParentView: UIView) {
        childVC.beginAppearanceTransition(true, animated: false)
        toParentView.addSubview(childVC.view)
        childVC.endAppearanceTransition()
        childVC.didMove(toParent: self)
    }
}


// source: https://github.com/freak4pc/UIView-Positioning
extension UIView{
    // MARK: - Basic Properties
    var x:CGFloat{
        set{ self.frame = CGRect(x: _pixelIntegral(pointValue: newValue), y: self.y, width: self.width, height: self.height) }
        get{ return self.frame.origin.x }
    }
    
    var y:CGFloat{
        set { self.frame = CGRect(x: self.x, y: _pixelIntegral(pointValue: newValue), width: self.width, height: self.height) }
        get { return self.frame.origin.y }
    }
    
    var width: CGFloat{
        set { self.frame = CGRect(x: self.x, y: self.y, width: _pixelIntegral(pointValue: newValue), height:self.height) }
        get { return self.frame.size.width }
    }
    
    var height: CGFloat{
        set { self.frame = CGRect(x: self.x, y: self.y, width: self.width, height: _pixelIntegral(pointValue: newValue)) }
        get { return self.frame.size.height }
    }
    
    // MARK: - Origin and Size
    var origin: CGPoint{
        set { self.frame = CGRect(x: _pixelIntegral(pointValue: newValue.x), y:_pixelIntegral(pointValue: newValue.y), width: self.width, height:self.height) }
        get { return self.frame.origin }
    }
    
    var size: CGSize{
        set { self.frame = CGRect(x: self.x, y: self.y, width: _pixelIntegral(pointValue: newValue.width), height: _pixelIntegral(pointValue:newValue.height)) }
        get { return self.frame.size }
    }
    
    // MARK: - Extra Properties
    var right: CGFloat{
        set { self.x = newValue - self.width }
        get { return self.x + self.width }
    }
    
    var bottom: CGFloat{
        set { self.y = newValue - self.height }
        get { return self.y + self.height }
    }
    
    var top: CGFloat {
        set { self.y = newValue }
        get { return self.y }
    }
    
    var left: CGFloat {
        set { self.x = newValue }
        get { return self.x }
    }
    
    var centerX: CGFloat{
        set { self.center = CGPoint(x: newValue,y :self.centerY) }
        get { return self.center.x }
    }
    
    var centerY: CGFloat {
        set { self.center = CGPoint(x:self.centerX, y:newValue) }
        get { return self.center.y }
    }
    
    var lastSubviewOnX:UIView?{
        get {
            var outView:UIView = self.subviews[0] as UIView
            
            for v in self.subviews as [UIView] {
                if(v.x > outView.x){ outView = v }
            }
            
            return outView
        }
    }
    
    var lastSubviewOnY:UIView?{
        get {
            var outView:UIView = self.subviews[0] as UIView
            
            for v in self.subviews as [UIView] {
                if(v.y > outView.y){ outView = v }
            }
            
            return outView
        }
    }
    
    // MARK: - Bounds Methods
    var boundsX:CGFloat{
        set{
            self.bounds = CGRect(x: _pixelIntegral(pointValue: newValue), y: self.boundsY, width: self.boundsWidth, height: self.boundsHeight) }
        get{ return self.bounds.origin.x }
    }
    
    var boundsY:CGFloat{
        set { self.frame = CGRect(x: self.boundsX, y: _pixelIntegral(pointValue:newValue), width: self.boundsWidth, height: self.boundsHeight) }
        get { return self.bounds.origin.y }
    }
    
    var boundsWidth: CGFloat{
        set { self.frame = CGRect(x: self.boundsX, y: self.boundsY, width:_pixelIntegral(pointValue:newValue), height: self.boundsHeight) }
        get { return self.bounds.size.width }
    }
    
    var boundsHeight: CGFloat{
        set { self.frame = CGRect(x: self.boundsX, y: self.boundsY, width: self.boundsWidth, height: _pixelIntegral(pointValue:newValue)) }
        get { return self.bounds.size.height }
    }
    
    // MARK: - Useful Methods
    func centerToParent(){
        if(self.superview != nil){
            //UIDevice.currentDevice().orientation
            /*
             UIDeviceOrientationUnknown,
             UIDeviceOrientationPortrait,            // Device oriented vertically, home button on the bottom
             UIDeviceOrientationPortraitUpsideDown,  // Device oriented vertically, home button on the top
             UIDeviceOrientationLandscapeLeft,       // Device oriented horizontally, home button on the right
             UIDeviceOrientationLandscapeRight,      // Device oriented horizontally, home button on the left
             UIDeviceOrientationFaceUp,              // Device oriented flat, face up
             UIDeviceOrientationFaceDown             // Device oriented flat, face down
             */
            //ios 9 decreped
            //UIApplication.sharedApplication().statusBarOrientation
            switch(UIDevice.current.orientation){
                case .landscapeLeft:
                    fallthrough
                case .landscapeRight:
                    self.origin = CGPoint(x:(self.superview!.height / 2) - (self.width / 2),
                                          y:(self.superview!.width / 2) - (self.height / 2))
                case .portrait:
                    fallthrough
                case .portraitUpsideDown:
                    self.origin = CGPoint(x:(self.superview!.width / 2) - (self.width / 2),
                                          y:(self.superview!.height / 2) - (self.height / 2))
                case .unknown:
                    return
                default:
                    return
            }
        }
    }
    
    // MARK: - Private Methods
    private func _pixelIntegral(pointValue:CGFloat) -> CGFloat{
        let scale   = UIScreen.main.scale
        return (round(pointValue * scale) / scale)
    }
}
