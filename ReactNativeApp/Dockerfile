FROM node:18-alpine AS build

WORKDIR /app

# Copiar apenas os arquivos de configuração primeiro
COPY package*.json ./
COPY babel.config.js ./

# Instalar todas as dependências necessárias
RUN npm install --legacy-peer-deps && \
    npm install --save-dev \
    react-scripts@5.0.1 \
    @babel/plugin-proposal-private-property-in-object \
    @babel/preset-react \
    babel-plugin-react-native-web

# Criar diretório src e public
RUN mkdir -p src public

# Copiar arquivos necessários
COPY public/ ./public/
COPY src/ ./src/
COPY App.js ./src/
COPY index.js ./src/

# Configurar babel para web
RUN echo '{ "presets": ["@babel/preset-react"], "plugins": ["react-native-web"] }' > .babelrc

# Criar arquivo de configuração para o React Scripts
RUN echo '{ "name": "hackaton-web", "version": "0.1.0", "private": true }' > ./public/manifest.json

# Build da aplicação
RUN npm run web:build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80