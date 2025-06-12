FROM node:13-alpine
WORKDIR /home/wayshub
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
