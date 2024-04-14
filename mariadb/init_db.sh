#!/bin/sh

# Function to check if the database is ready
wait_for_database() {
  DB_USER="root"
  DB_PASS=$MARIADB_ROOT_PASSWORD
  
  # Maximum attempts to connect
  MAX_TRIES=20
  TRIES=0

  echo "Waiting for the database to be ready..."

  # Loop until the database is ready or maximum attempts are reached
  until mariadb -u $DB_USER -p$DB_PASS -e "SELECT 1;" >/dev/null 2>&1 || [ $TRIES -eq $MAX_TRIES ]; do
    sleep 1
    TRIES=$(($TRIES + 1))
  done
  
  if [ $TRIES -eq $MAX_TRIES ]; then
    echo "Timeout reached. Unable to connect to the database."
    exit 1
  else
    echo "Database is ready."
  fi
}

# Function to initialize the database
initialize_database() {
  # Parameters
  DB_USER="root"
  DB_PASS=$MARIADB_ROOT_PASSWORD
  NEW_USER="$1"
  NEW_PASSWORD="$2"
  NEW_DATABASE="$3"

  # Check if the user already exists
  EXIST_USER=$(mariadb -u $DB_USER -p$DB_PASS -e "SELECT 1 FROM mysql.user WHERE user='$NEW_USER';" | grep 1)
  
  if [ -n "$EXIST_USER" ]; then
    echo "User $NEW_USER already exists in the database."
  else
    # Create the new user with privileges only on the specific database
    mariadb -u $DB_USER -p$DB_PASS -e "CREATE USER '$NEW_USER'@'%' IDENTIFIED BY '$NEW_PASSWORD';"
    mariadb -u $DB_USER -p$DB_PASS -e "GRANT ALL PRIVILEGES ON $NEW_DATABASE.* TO '$NEW_USER'@'%';"
    echo "User $NEW_USER created successfully with privileges on database $NEW_DATABASE."
  fi

  # Check if the database already exists
  EXIST_DB=$(mariadb -u $DB_USER -p$DB_PASS -e "SHOW DATABASES LIKE '$NEW_DATABASE';" | grep $NEW_DATABASE)

  if [ -n "$EXIST_DB" ]; then
    echo "Database $NEW_DATABASE already exists on the server."
  else
    # Create the new database if it doesn't exist
    mariadb -u $DB_USER -p$DB_PASS -e "CREATE DATABASE $NEW_DATABASE;"
    echo "Database $NEW_DATABASE created successfully."
  fi
}

wait_for_database

# NEW_USER="$1"
# NEW_PASSWORD="$2"
# NEW_DATABASE="$3"
initialize_database $1 $2 $3
