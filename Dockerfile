FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
# builder 이미지의 폴더에서 파일을 복사하는 명령어
COPY --from=builder /usr/src/app/build /usr/share/nginx/html



