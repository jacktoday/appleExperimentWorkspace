//
//  main.m
//  ObjcExplore
//
//  Created by fulin on 21/8/21.
//

#import <Foundation/Foundation.h>
#import "House.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        House *house = [[House alloc] init];
        house.numberOfBedrooms = 10;
        NSLog(@"%d", house.numberOfBedrooms);
    
    }
    return 0;
}
