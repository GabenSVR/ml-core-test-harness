# Base Image
FROM node:Latest

# Create a directory for the application
WORKDIR /app

# Copy package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN git clone https://github.com/mojaloop/ml-core-test-harness.git

RUN cd ml-core-test-harness
RUN docker-compose --profile all-services --profile ttk-provisioning --profile ttk-tests up

# Copy the application code to the container
COPY . .

# Expose port 3000 for the API adapter service
EXPOSE 3000

# Command to start the API adapter service
CMD ["npm", "start"]
