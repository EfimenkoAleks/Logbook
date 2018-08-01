//
//  MyCarTableViewController.m
//  Logbook
//
//  Created by mac on 12.05.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "MyCarTableViewController.h"
#import "DataManager.h"

@interface MyCarTableViewController ()

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, strong) NSPersistentContainer *persistentContainer;

@end

@implementation MyCarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_managedObjectContext){
        _persistentContainer=[[DataManager dataManager] persistentContainer ];
        _managedObjectContext=_persistentContainer.viewContext;
    }
    
    NSError *error;
    NSFetchRequest *fechRequest=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Car" inManagedObjectContext:_managedObjectContext];
    [fechRequest setEntity:entity];
    NSArray *feches=[_managedObjectContext executeFetchRequest:fechRequest error:&error];
    
        if(feches.count > 0){
            NSLog(@"count %lu ",(unsigned long)feches.count);
             for (NSManagedObject *obj in feches) {
                 if([obj isKindOfClass: [Car class]]){
                     Car *car =(Car *) obj;
                 NSLog(@"%@ %@",car.name,car.subName);
                 }
             }
        }
    
    UIColor *color=[UIColor grayColor];
    self.view.backgroundColor=color;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    Car *car = [self.fetchedResultsController objectAtIndexPath:indexPath];
    int keyCar=0;
    keyCar = car.namberCar;
    NSLog(@"CurentCar=%i",keyCar);
    NSString *kCurentCar=@"kCurentCar";
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:[NSNumber numberWithInt:keyCar] forKey:kCurentCar];
    [userDefault synchronize];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier=@"MyCarCell";
    
    MyCarCellTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if(customCell==nil){
        customCell = [[MyCarCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCarCell"];
    }
    
    Car *car = [self.fetchedResultsController objectAtIndexPath:indexPath];
    customCell.myModel.text=car.name;
    customCell.mySubModel.text=car.subName;
    customCell.myMileage.text=car.mileage;
    
    return customCell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
   //  Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];

        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }
    }
}


//- (void)configureCell:(UITableViewCell *)cell withEvent:(Event *)event {
//    cell.textLabel.text = event.timestamp.description;
//}


#pragma mark - Fetched results controller

- (NSFetchedResultsController<Car *> *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest<Car *> *fetchRequest = Car.fetchRequest;
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController<Car *> *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;

    NSError *error = nil;
        
    if (![aFetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
    _fetchedResultsController = aFetchedResultsController;
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;

        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;

        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    UITableView *tableView = self.tableView;

    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;

        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;

        case NSFetchedResultsChangeUpdate:
          //  [self configureCell:[tableView cellForRowAtIndexPath:indexPath] withEvent:anObject];
            break;

        case NSFetchedResultsChangeMove:
           // [self configureCell:[tableView cellForRowAtIndexPath:indexPath] withEvent:anObject];
            [tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


@end
