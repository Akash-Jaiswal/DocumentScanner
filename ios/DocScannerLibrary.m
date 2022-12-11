// DocScannerLibrary.m

//#import "DocScannerLibrary.h"


//@implementation DocScannerLibrary
//
//RCT_EXPORT_MODULE()
//
//RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
//{
//    // TODO: Implement some actually useful functionality
//    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
//}
//RCT_EXPORT_METHOD(showMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
//{
//    // TODO: Implement some actually useful functionality
//    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
//}
//@end

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import "RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(DocScannerLibrary, UIViewController)
RCT_EXTERN_METHOD(openCamera)
@end
@interface RCT_EXTERN_MODULE(RNEventEmitter, RCTEventEmitter)
@end
