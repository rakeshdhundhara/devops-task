FROM node:18-alpine

WORKDIR /app

COPY devops-task/package*.json ./
RUN npm install

COPY devops-task/ .

CMD ["node", "app.js"]
