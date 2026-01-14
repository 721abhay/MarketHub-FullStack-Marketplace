FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production

# Bundle app source
COPY . .

# Expose the API port
EXPOSE 3000

# Start the application
CMD [ "node", "index.js" ]
