Partner Up 1.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10/15/14
=========

######Change Current Course
+ Students can change which course they are adding partners for

######View Roster
+ Professors and TAs can view a list of all students who have registered an account and what groups they are in

######Upload CSV
+ Professors and TAs have the ability to upload students, course code, course title, ta's with access, and instructor name.

Documentation and Support
-------------------------

### Models
####Has many through relations added everywhere
###Groups
+ Group model added

###Group_relations
+ Join table has many through that stores who is in which group

###Roster
+ Roster is a has any through join table that stores who is in which course

###Projects
+ Projects are created and edited by professors and are also used to determine who can partner with who

###Courses
+ Courses have all the course info parsed from the Webroster CSV

### Controllers
####Users_controller
+ set_course - sets current_course in database so that the user will go back to the same course they left last session

####Courses_controller
+ import_csv - Opens and parses csv file and gets the name, ucinetid, email, course code, course title, instructor and TA's authorized to access the roster.  Regex is used to get them.

####Application_controller
+ Added Webauth cookie parsing for signin


### Issues

+ Report bug not working at the moment
+ Partnerships down for database updates
+ Email updates down for now
