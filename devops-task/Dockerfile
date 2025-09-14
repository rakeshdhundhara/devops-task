# Use lightweight Node.js Alpine image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files (if you have dependencies)
COPY package*.json ./

# Install dependencies (skip if no package.json)
RUN npm install 

# Copy application files
COPY . .

# Command to run your script
CMD ["node", "app.js"]
