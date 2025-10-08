FROM node:18-alpine AS build

WORKDIR /app

# Copiar apenas os arquivos de configuração primeiro
COPY package*.json ./
COPY babel.config.js ./

# Instalar todas as dependências, incluindo react-scripts
RUN npm install --legacy-peer-deps && \
    npm install --save-dev react-scripts@5.0.1 @babel/plugin-proposal-private-property-in-object

# Copiar o resto dos arquivos
COPY . .

# Criar arquivo de configuração web
RUN echo '{ "presets": ["@babel/preset-react"] }' > .babelrc

# Build da aplicação
RUN npm run web:build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80