

#import <UIKit/UIKit.h>
 
@interface QuizController : UIViewController < UITableViewDelegate, UITableViewDataSource>
{
    int                     currentSelectedQuestion;
    NSDictionary            *quizData;
    NSMutableArray          *answerList;
    IBOutlet UIView         *viewQuestion;
    IBOutlet UIView         *viewResult;
    
    IBOutlet UILabel        *lblQuestionN;
    IBOutlet UIButton       *btnPrev;
    IBOutlet UIButton       *btnNext;
    
    IBOutlet UILabel        *lblRight;
    IBOutlet UILabel        *lblWrong;
    IBOutlet UITableView    *tblResult;
    
}

-(IBAction) actionPrev:(id)sender;
-(IBAction) actionNext:(id)sender;
-(IBAction) actionChecked:(id)sender;
@end
