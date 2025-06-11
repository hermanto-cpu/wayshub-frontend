FROM node:13-alpine
WORKDIR /home/wayshub
COPY . .
RUN npm install
EXPOSE 3000
CMD ["npm","start"]
