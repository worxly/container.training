
FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/socketio/socket.io.git

FROM node:carbon-alpine
WORKDIR /app
COPY --from=0 /app/socket.io /app

RUN npm install --only=production
WORKDIR  /app/examples/chat
RUN npm install --only=production

EXPOSE 3000
CMD [ "npm", "start" ]