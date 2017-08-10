

import UIKit

class YYCycleScrollView: UIView,UIScrollViewDelegate {

    var _totalPagesCount:(()->Int)!
    var totalPagesCount:(()->Int)!{
    set{
        self._totalPagesCount = newValue
        self.totalPageCount = _totalPagesCount()
        self.pageControl.numberOfPages = newValue()
        self.configContentViews()
    }
    get{
        return self._totalPagesCount
    }
    }
    
    var fetchContentViewAtIndex:((_ pageIndex:Int)->UIView)!
    
    var TapActionBlock:((_ pageIndex:Int)->())!
    
    var _currentPageIndex:Int!
    var currentPageIndex:Int!{
    set{
        self._currentPageIndex = newValue
        if (self.pageControl != nil){
            self.pageControl.currentPage = newValue
        }
    }
    get{
        return self._currentPageIndex
    }
    }
    
    var totalPageCount:Int!
    var contentViews:NSMutableArray!
    var animationTimer:Timer!
    var animationDuration:TimeInterval!
    
    var _showPageControl:Bool!
    var showPageControl:Bool!{
    set{
        self._showPageControl = newValue
        self.pageControl.isHidden = !newValue
    }
    get{
        return self._showPageControl
    }
    }
    
    var pageControl:UIPageControl!
    var scrollView:UIScrollView!
    
    init(frame:CGRect,animationDuration:TimeInterval){
        super.init(frame: frame)
        if animationDuration>0.0 {
            self.animationTimer = Timer.scheduledTimer(timeInterval: animationDuration, target: self, selector: #selector(YYCycleScrollView.animationTimerDidFired(_:)), userInfo: nil, repeats: true)
        }
        
        self.autoresizesSubviews = true
        self.scrollView = UIScrollView(frame:self.bounds)
        //self.scrollView.autoresizingMask = 0xFF
        self.scrollView.contentMode = UIViewContentMode.center
        self.scrollView.contentSize = CGSize(width: 3 * self.scrollView.frame.width, height: self.scrollView.frame.height);
        self.scrollView.delegate = self
        self.scrollView.contentOffset = CGPoint(x: self.scrollView.frame.width, y: 0)
        self.scrollView.isPagingEnabled = true
        self.addSubview(self.scrollView)
        self.currentPageIndex = 0
        
        self.pageControl = UIPageControl()
        self.pageControl.center = CGPoint(x: frame.size.width/2,y: frame.size.height-25)
        self.addSubview(pageControl)
        
        self.showPageControl = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configContentViews(){
        for view:AnyObject in self.scrollView.subviews{
            (view  as! UIView).removeFromSuperview()
        }
        self.setScrollViewContentDataSource()
        var counter:Int = 0
        for i in 0..<self.contentViews.count{
            let contentView = self.contentViews.object(at: i) as! UIView
            contentView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target:self,action:#selector(YYCycleScrollView.contentViewTapAction(_:)))
            contentView.addGestureRecognizer(tapGesture)
            var rightRect = contentView.frame;
            rightRect.origin = CGPoint(x: self.scrollView.frame.width * CGFloat(i), y: 0)
            contentView.frame = rightRect
            self.scrollView.addSubview(contentView)
        }
        self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.size.width,y: 0), animated: false)
    }
    
    func setScrollViewContentDataSource(){
        let previousPageIndex = self.getValidNextPageIndexWithPageIndex(self.currentPageIndex - 1)
        let rearPageIndex = self.getValidNextPageIndexWithPageIndex(self.currentPageIndex + 1)
        if self.contentViews == nil {
            self.contentViews = NSMutableArray()
        }
        self.contentViews.removeAllObjects()
        
        if (self.fetchContentViewAtIndex != nil) {
            self.contentViews.add(self.fetchContentViewAtIndex(pageIndex: previousPageIndex))
            self.contentViews.add(self.fetchContentViewAtIndex(pageIndex: self.currentPageIndex))
            self.contentViews.add(self.fetchContentViewAtIndex(pageIndex:rearPageIndex))
        }
    }
    
    func getValidNextPageIndexWithPageIndex(_ currentPageIndex:Int)->Int{
        if currentPageIndex == -1{
            return self.totalPageCount - 1
        }else if currentPageIndex == self.totalPageCount{
            return 0
        }else {
            return currentPageIndex
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let contentOffsetX = scrollView.contentOffset.x
        if contentOffsetX >= 2.0 * scrollView.frame.width {
            self.currentPageIndex = self.getValidNextPageIndexWithPageIndex(self.currentPageIndex + 1)
            self.configContentViews()
        }
        if contentOffsetX <= 0 {
            self.currentPageIndex = self.getValidNextPageIndexWithPageIndex(self.currentPageIndex - 1)
            self.configContentViews()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.width, y: 0),animated:true)
    }
    
    
    func animationTimerDidFired(_ timer:Timer){
        let newOffset = CGPoint(x: self.scrollView.contentOffset.x + self.scrollView.frame.width, y: self.scrollView.contentOffset.y)
        self.scrollView.setContentOffset(newOffset,animated:true)
    }
    
    func contentViewTapAction(_ tap:UITapGestureRecognizer){
        if (self.TapActionBlock != nil){
            self.TapActionBlock(pageIndex: self.currentPageIndex)
        }
    }
}

