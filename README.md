# Vokabeltrainer

Dockerisieren Sie die Applikation
1. ohne docker compose
2. mit docker compose

## Hints

* die postgres-docker.sh ist teilweise fehlerhaft
* logs lesen
* invalid ELF headers?  
  die node_modules sollten nicht in das Image kopiert werden, sondern installiert
* angular-Container startet, curl aus dem Container heraus geht, aber der Browser kann die Seite nicht laden?  
  `ng serve --host 0.0.0.0` - ansonsten ist der Server nur auf localhost **im Container** erreichbar
* angular-Container start, curl aus dem Container heraus geht, sodass das Backend antwortet, aber Browser-Probleme?
  der Browser kann die URL nicht auflösen, weil er keinen Zugriff auf den Docker DNS-hat, wir brauchen einen [nginx](https://nginx.org/en/docs/beginners_guide.html) Reverse-Proxy
* der nginx funktioniert nur fürs Frontend?  
  Ports überprüfen, sind an zwei Stellen relevant
* das Frontend sollte nie gar nicht unter keinen Umständen zur Datenbank können
* es muss genau ein einziger port geforwarded werden

## Instructions to build and run the application using Docker and Docker Compose

### Dockerize without Docker Compose

#### Backend

1. Navigate to the `backend` directory:
   ```sh
   cd backend
   ```

2. Build the Docker image for the backend:
   ```sh
   docker build -t backend-image .
   ```

3. Run the Docker container for the backend:
   ```sh
   docker run -d -p 8000:8000 --name backend-container backend-image
   ```

#### Frontend

1. Navigate to the `frontend` directory:
   ```sh
   cd frontend
   ```

2. Build the Docker image for the frontend:
   ```sh
   docker build -t frontend-image .
   ```

3. Run the Docker container for the frontend:
   ```sh
   docker run -d -p 4200:4200 --name frontend-container frontend-image
   ```

### Dockerize with Docker Compose

1. Navigate to the root directory of the project:
   ```sh
   cd ..
   ```

2. Build and run the Docker containers using Docker Compose:
   ```sh
   docker-compose up --build
   ```

3. Ensure the services can communicate with each other and are properly configured.
