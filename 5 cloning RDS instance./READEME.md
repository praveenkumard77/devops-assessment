
# A Bash File To Create The RDS Instance

  ## clone the script into your local machine
      git clone
  ## Navigate to the folder
      cd cloning RDS instance.
      
  ## Edit the script and replace instance name with your own instance name
      test-mysql
        replace the above value with your instance name
      testing
         replace the above value with your choice ( Dev/QA/Testing/Staging)
         
  ## Then run the script file
        ./stagingdb.sh
   
Note : If you want to modify the security group, subnet group and other values according to the environment. Give the values manually in the script.
