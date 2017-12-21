#!/usr/bin/env bash

set -e   # stop on any error

# Allow for local and global execution (default)
EXEC_FOR=${1:-global}

set -u   # crash on missing env variables

if [ $EXEC_FOR = "local" ]
then
    # Define location for processing scripts
    export FUNDERINGEN_MAIN_DIR=`cd ..; pwd`
    # Define location for saving data files
    export FUNDERINGEN_DATA_DIR=${FUNDERINGEN_MAIN_DIR}/data/
    DATABASE_HOST=localhost
    DATABASE_PORT=5404
    DATABASE_NAME=funderingen
    DATABASE_USER=funderingen
    DATABASE_PASSWORD=insecure
else
    # Define location for processing scripts
    export FUNDERINGEN_MAIN_DIR=/app
    # Define location for saving data files
    export FUNDERINGEN_DATA_DIR=/tmp/data/
fi

export FUNDERINGEN_IMPORT_DIR=${FUNDERINGEN_MAIN_DIR}/import

# Provide for a location to extract and process data files
mkdir -p $FUNDERINGEN_DATA_DIR

# The import scripts are located in the import folder
cd $FUNDERINGEN_IMPORT_DIR

# Download the data files

# Extract the data files

# Process....

# Register database credentials
echo ${DATABASE_HOST}:${DATABASE_PORT}:${DATABASE_NAME}:${DATABASE_USER}:${DATABASE_PASSWORD} >> ~/.pgpass
chmod 600 ~/.pgpass

# Import in the database

# Continue in import folder for any other fixes
cd $FUNDERINGEN_IMPORT_DIR
