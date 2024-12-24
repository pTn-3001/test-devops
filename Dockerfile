FROM node:19-alpine3.16
WORKDIR /app
COPY . /app
EXPOSE 3000
RUN npm intstall
CMD ["npm", "run", "start"]