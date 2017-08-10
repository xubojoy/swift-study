

import Foundation

extension Timer {
    
    func pauseTimer(){
        if !self.isValid{
            return
        }
        self.fireDate = Date.distantFuture 
    }
    
    func resumeTimer(){
        if !self.isValid{
            return
        }
        self.fireDate = Date()
    }
    
    func resumeTimerAfterTimeInterval(_ interval:TimeInterval){
        if !self.isValid{
            return
        }
        self.fireDate = Date(timeIntervalSinceNow:interval)
    }
}
