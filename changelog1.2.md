Partner Up 1.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10/15/14
=========
<img src="http://i62.tinypic.com/eg5veu.png" style="max-width:550px;">
Partner up 1.2 is a partner management website that will update the current methods of class partner management which are tedious and cumbersome. Partner up is a fast and easy way for students to find partners and provides an effortless way for professors to oversee student progress.

Description of Updates
-----------------
Our MVP has changed this summer in the following ways

1.  Account Creation and Updating
2.  Webauth Cookie Login
3.  Download CSV data spreadsheet
4.  Upload and parse CSV data spreadsheet
4.  What ifs covered
    * What if a user already has an account when a roster is uploaded?
    * What if professors upload an outdated csv? (In Progress)
    * What if professors want to add a new student not in the CSV? (In Progress)
    * What if a professor allows the last leftover student in a class to join and make one three person group?
    * What if a student uses links to use professor access level functions? (Policy update after Partnerships)
    * 


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
Email account is set to ryderc@uci.edu right now <br>
All partner request emails will be sent from ryderc@uci.edu. <br>
All Bug reports will be sent to ryderc@uci.edu <br>
The application is configured to send email using a Gmail account.

Features
--------
####Auto create account with sign in to webauth OR upload of roster
+ Sign up will create an account in the database

####Sign in/Sign out
+ Sign in / Sign out will destroy or create a new user session

####Edit Account
+ Users can edit their name, email or profile picture if they want. 

####Delete Account
+ Users can delete their accounts

####Student View

######Change Current Course
+ Students can change which course they are adding partners for

######View Profile
+ Students can view their own and other student's profiles

####Professor View

######View Roster
+ Professors and TAs can view a list of all students who have registered an account and what groups they are in

######Download Roster
+ Professors and TAs can download a CSV file of the partnership data

######Upload CSV
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

###Roster
+ Roster is a has any through join table that stores who is in which course

###Projects
+ Projects are created and edited by professors and are also used to determine who can partner with who

###Courses
+ Courses have all the course info parsed from the Webroster CSV

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

+ Report bug not working at the moment
+ Partnerships down for database updates
+ Email updates down for now

Credits
-------
<img src="http://i58.tinypic.com/264l3pj.png" style="max-width:550px;">
