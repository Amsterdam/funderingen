# Funderingen

API and import module

## development

* python 3.6
* docker-compose


    python3 -m venv ~/venv/funderingen
    source ~/venv/funderingen/bin/activate

### installation

install required modules

    cd src
    pip install -r requirements.txt
    cd ..

and possibly

    pip install git+https://github.com/amsterdam/objectstore.git
    

### start database

    docker-compose up database
    
### configure objectstore access

    export FUNDERINGEN_OBJECTSTORE_PASSWORD=<secret_password>
    
### import data

    cd src/import
    sh import.sh local
    cd ../..

### Run server 
 
    cd src
    python manage.py runserver
 