# Use node:14 as the base image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Run npm install to install dependencies
RUN npm install

# Copy the rest of the frontend code to the working directory
COPY . .

# Expose port 4200
EXPOSE 4200

# Set the command to run the frontend server using npm run start_test
CMD ["npm", "run", "start_test"]
