FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production || true
COPY . .
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:3000/health || exit 1
CMD ["node", "server.js"]

