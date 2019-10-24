#import "OrgParserPlugin.h"
#import <org_parser/org_parser-Swift.h>

@implementation OrgParserPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOrgParserPlugin registerWithRegistrar:registrar];
}
@end
