# Instruções de Implantação Kubernetes

## Pré-requisitos
- Kubernetes cluster instalado (ou minikube)
- kubectl instalado e configurado
- Docker instalado

## Estrutura dos Arquivos
```
k8s/
├── backend.yaml      # Deployment e Service do backend
├── frontend.yaml     # Deployment e Service do frontend
├── ingress.yaml      # Configuração do Ingress
├── kustomization.yaml # Configuração do Kustomize
└── deploy.ps1        # Script de implantação
```

## Passos para Implantação

```powershell
# 1. Navegue até a pasta do projeto
cd c:\Users\Administrador\Downloads\hackaton

# 2. Execute o script de implantação
.\k8s\deploy.ps1
```

O script `deploy.ps1` vai:
- Construir as imagens Docker do backend e frontend
- Carregar as imagens no minikube
- Criar o namespace `hackaton`
- Habilitar o addon do ingress
- Aplicar todas as configurações do Kubernetes

## Verificando a Implantação
```powershell
# Verificar os pods
kubectl get pods -n hackaton

# Verificar os serviços
kubectl get services -n hackaton

# Verificar o ingress
kubectl get ingress -n hackaton
```

## Acessando a Aplicação
- Se estiver usando minikube:
  ```powershell
  # Obter o IP do cluster
  minikube ip
  ```
- Frontend: `http://<ip-do-cluster>/`
- Backend API: `http://<ip-do-cluster>/api`

## Recursos Implantados

### Backend
- 2 réplicas para alta disponibilidade
- Limites de recursos configurados (CPU e memória)
- Health checks configurados
- Exposto na porta 80

### Frontend
- 2 réplicas para alta disponibilidade
- Limites de recursos configurados
- Health checks configurados
- Exposto na porta 80

## Comandos Úteis

### Logs e Monitoramento
```powershell
# Ver logs do backend
kubectl logs -n hackaton -l app=backend

# Ver logs do frontend
kubectl logs -n hackaton -l app=frontend

# Reiniciar deployments
kubectl rollout restart deployment/backend -n hackaton
kubectl rollout restart deployment/frontend -n hackaton

# Escalar número de réplicas
kubectl scale deployment/backend -n hackaton --replicas=3
kubectl scale deployment/frontend -n hackaton --replicas=3
```

### Solução de Problemas
```powershell
# Verificar descrição detalhada do pod
kubectl describe pod -n hackaton <nome-do-pod>

# Verificar status do ingress
kubectl describe ingress -n hackaton

# Ver eventos do namespace
kubectl get events -n hackaton
```

### Monitoramento
- Health check do backend: `http://<ip-do-cluster>/api/health`
- Verificar recursos dos pods:
  ```powershell
  kubectl top pods -n hackaton
  ```

### Limpeza
```powershell
# Remover toda a implantação
kubectl delete namespace hackaton
```

## Benefícios da Configuração
- Alta disponibilidade com múltiplas réplicas
- Balanceamento de carga automático
- Monitoramento de saúde e reinício automático
- Gerenciamento de recursos
- Escalabilidade fácil
- Roteamento de URL limpo

## Observações Importantes
- Certifique-se de que o Docker esteja rodando antes de iniciar a implantação
- Verifique se o minikube está iniciado e configurado corretamente
- Em caso de problemas com o ingress, pode ser necessário aguardar alguns minutos para a configuração ser aplicada
- Mantenha os recursos do cluster monitorados para garantir performance adequada

## Suporte
Em caso de dúvidas ou problemas durante a implantação, verifique:
1. Logs dos pods
2. Eventos do namespace
3. Status do ingress
4. Configurações de rede do cluster