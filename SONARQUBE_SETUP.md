# Configuração do SonarQube

## Servidor SonarQube
- **Host**: http://172.184.118.26:9000
- **Worker**: sonar

## Projetos configurados
- **hackaton-dotnet**: Análise do projeto .NET
- **hackaton-react-native**: Análise do projeto React Native

## Como gerar o token no SonarQube

1. Acesse o SonarQube: http://172.184.118.26:9000
2. Faça login
3. Vá em **User** → **My Account** → **Security**
4. Em **Generate Tokens**:
   - Name: `github-actions-hackaton`
   - Type: `Global Analysis Token` ou `Project Analysis Token`
   - Clique em **Generate**
5. Copie o token gerado

## Adicionar token no GitHub

1. No repositório GitHub, vá em **Settings** → **Secrets and variables** → **Actions**
2. Clique em **New repository secret**
3. Adicione:
   - **Name**: `SONAR_TOKEN`
   - **Value**: Cole o token copiado do SonarQube
4. Clique em **Add secret**

## Criar projetos no SonarQube (se necessário)

Se os projetos ainda não existem no SonarQube:

1. Acesse: http://172.184.118.26:9000
2. Vá em **Projects** → **Create Project**
3. Crie dois projetos:
   - **Project key**: `hackaton-dotnet`
   - **Project key**: `hackaton-react-native`

Ou deixe o primeiro push criar automaticamente os projetos.
