# Use the official Node.js image from the Docker Hub
FROM node:20

# Create and change to the app directory
WORKDIR \Users\Public\Dev\nodeJs> 

# Copy application dependency manifest to the container image.
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Run the web service on container startup.
CMD [ "npm", "start" ]

# Inform Docker that the container listens on port 3000
EXPOSE 3000
