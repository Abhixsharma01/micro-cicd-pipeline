FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files first (for caching)
COPY user-service/package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy all source files from user-service folder
COPY user-service/ .

# Expose the app port
EXPOSE 5000

# Start the app
CMD ["node", "index.js"]
