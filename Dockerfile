FROM node:22.11.0-alpine
WORKDIR /app
COPY . /app
EXPOSE 3000
RUN npm install
CMD ["npm", "run", "start"]