Partner Up 1.3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3/15/15
=========
<img src="http://i61.tinypic.com/2j11pjo.png" border="0" style="max-width:550px;">
Partner up 1.3 is a partner management website that will update the current methods of class partner management which are tedious and cumbersome. Partner up is a fast and easy way for students to find partners and provides an effortless way for professors to oversee student progress.

Description of Updates
-----------------
Partnerup has changed over the winter in the following ways:

1.  Interface Redesign
2.  Automatic Webauth Login Integration
3.  Download CSV of 
    - Groups
    - Students by Group Status
    - Evaluations
    - Evaluation Summary
4.  Auto-Grouping 
5.  Modals for Forms
6.  Provides user feedback when uploading CSV by:
    - disabling button until file is uploaded
    - disabling button when upload button is clicked, and changes text to loading
7.  Robustly upload and parse CSV data spreadsheet
8.  Band-Aid Temporary Student Evaluations
9.  What ifs covered
    * What if a user already has an account when a roster is uploaded?
    * What if professors upload an outdated csv?
    * What if professors want to add a new student not in the CSV?
    * What if a professor allows the last leftover student in a class to join and make one three person group?
    * What if a professor autogroups when students have already partnered up?


&nbsp;&nbsp;&nbsp;&nbsp;It uses accounts created in the database to identify users and has different views for different user "roles". It requires email confirmation to sign in and access the features of the website. We have a feature in case students forget their password that will email a link to allow them to change their password. This will prevent students from being locked out of their account. Forgot password and email confirmations will expire after a given amount of time, and only one token is active at a time. This is to add a layer of security so users will not have their accounts comprimised if their email accounts are comprimised.<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;Professors and TAs can view the list of students signed up and their respective partners. At the bottom of the table there is a button that will download the table in csv format. At the moment we only track one project at a time, so in the case of a new project the TA user could clear the table and reset the users to unpartnered status, after downloading the partnerhip data of the previous project.


Diagnostics
-----------

<table>
  <tr>
    <th>Gems</th>
    <th>Recipes</th>
  </tr>
  <tr>
    <td rowspan="3"><ul><li>gem 'rails', '4.1.1'</li><li>gem 'sass-rails', '~> 4.0.3'</li><li>gem 'uglifier', '>= 1.3.0'</li><li>gem 'coffee-rails', '~> 4.0.0'</li><li>gem 'jquery-rails'</li><li>gem 'turbolinks'</li><li>gem 'jbuilder', '~> 2.0'</li><li>gem 'sdoc', '~> 0.4.0', group: :doc</li><li>gem 'spring', group: :development</li><li>gem 'bootstrap-sass'</li><li>gem 'devise'</li><li>gem 'mysql2'</li><li>gem 'pundit'</li><li>gem 'simple_form'</li><li>gem 'better_errors'</li><li>gem 'binding_of_caller', :platforms=>[:mri_21]</li><li>gem 'quiet_assets'</li><li>gem 'rails_layout'</li><li>gem 'factory_girl_rails'</li><li>gem 'rspec-rails', '>= 3.0.0.beta2'</li><li>gem 'capybara'</li><li>gem 'database_cleaner'</li><li>gem 'faker'</li><li>gem 'launchy'</li><li>gem 'selenium-webdriver'</li></ul>
    <td><ul><li>controllers</li><li>email</li><li>gems</li><li>git</li><li>init</li><li>rails_bootstrap</li><li>rails_devise_pundit</li><li>railsapps</li><li>saas</li></ul></td></td>
  </tr>
  <tr>
    <th>Preferences</th>
  </tr>
  <tr>
    <td><ul><li>authentication: devise</li><li>authorization: pundit</li><li>dev_webserver: webrick</li><li>prod_webserver: same</li><li>templates: erb</li><li>tests: </li><li>frontend: bootstrap3</li><li>email: gmail</li><li>devise_modules: confirmable</li><li>form_builder: simple_form</li></ul></td>
  </tr>
</table>

Ruby on Rails
-------------

This application requires:

-   Ruby '2.1.0'
-   Rails '4.1.1'

Database
--------
This application uses MySQL with ActiveRecord.

Development
-----------

-   Template Engine: ERB
-   Testing: Test::Unit
-   Front-end: Bootstrap 3.0 (Sass)
-   Form Builder: SimpleForm
-   Authentication: Devise
-   Authorization: Pundit

Email
-------
Couldnt get email from ics support

Features
--------
######Auto create account with upload of roster
+ Upoading Roster will create an account in the database

######Sign in/Sign out
+ Sign in / Sign out will create or destroy a user session

######Edit Account
+ Users can edit their email, phone number, description, availability, or profile picture if they want. 

######Notifications
+ For students this lists all incoming group/user requests.
+ For professors this lets them know if a course has no project. 
+ In the future we want to have Professors notified if a students average evaluation score drops below a professor specified numeric value. 

######To-Dos
+ Lists all upcoming deadlines for projects the user has.

####Student View

######Change Current Course
+ Students can change which course they are adding partners for

######View Profile
+ Students can view their own and other student's profiles

######Send Request to User (to create new Group)
+ Students can send requests to other users to start a new group

######Send Request to Group (to join existing Group)
+ Students can send a request to existing groups to join that group, if there is room left

######Leave Group
+ Students can leave Groups at any time. Whether or not we should prevent them from leaving groups under certain circumstances has not been established yet.

####Professor View

######View Groups
+ Professors and TAs can view a list of all students who have registered an account and what groups they are in

######View Evaluations
+ Professors and TAs can view a list of all submitted evaluations by course and by project.

######Edit Project Rules
+ Bulk Upload was implemented, but will probably be delayed until next iteration due to its confusing interface
+ Partners can't repeat partners for different projects in the same course if specified in the project rules
+ Partnership Deadlines and Evaluation Deadlines implemented. When the specified Partnership Deadline passes, students cannot send requests anymore. When the Evaluation Deadline has passed, Students cannot evaluate their partners anymore.
+ Project Name can also be changed

######Download User Data
+ Professors and TAs can download a CSV file of the groups and evaluations.

######Upload WebRoster CSV
+ Professors and TAs have the ability to upload students, course code, course title, ta's with access, and instructor name.

Documentation and Support
-------------------------

###1. Models
#### Users
######Roles
| "Roles" | Types of User                 | Enum DB Value |
|---------|-------------------------------|---------------|
| User    | Student                       | 0             |
|  TA     | TA, Course Manager            | 1             |
|Professor| Professor, Course Manager     | 1             |
| Admin   | Webmaster, Professor Kay      | 2             |

###Groups
###Group_relations
+ Join table has many through that stores who is in which group


###Projects
+ Projects are created and edited by professors and are also used to determine who can partner with who

###Courses
###Roster
+ Roster is a has any through join table that stores who is in which course

###2. Controllers
####Users_controller
+ index
+ show - This can be used later to determine whether to show a user or not.
+ update - current code updates the attributes as secure parameters and displays alert messages to user
+ set_course - sets current_course in database so that the user will go back to the same course they left last session


####Courses_controller
+ index
+ import_csv - Opens and parses csv file and gets the name, ucinetid, email, course code, course title, instructor and TA's authorized to access the roster.  Regex is used to get them.

<img src= "http://i60.tinypic.com/14tlhft.png" style="max-width:550px;">

### Issues

+ Email down for now, but functionality still there. Used In the groups controller, ChangeMailer.

Credits
-------
<img src="http://i58.tinypic.com/264l3pj.png" style="max-width:200px;">

