
# Passos para instalacao Azure CLI:

1 - Realizar a instalação do Azure CLI (Azure Command-Line Interface).

https://learn.microsoft.com/pt-br/cli/azure/

2 - Realizar o login na Azure.

az login

3 - Selecionar uma Assinatura

az account set --subscription "Nome ou ID da Assinatura"

Para listar todas as suas assinaturas e encontrar o nome ou ID da assinatura desejada, use:

az account list --output table

4 - Verificar a Conexão

az account show

# Passos para instalacao Terraform:

1 - Realizar a instalação do Terraform.

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

2 - Inicializar um Diretório de Trabalho:

Crie um novo diretório para seus arquivos de configuração do Terraform.

mkdir terraform-project
cd terraform-project

3 - Escrever a Configuração do Terraform
Abra o arquivo main.tf e adicione a configuração básica para provisionar o cluster Kubernets Azure:

Arquivo anexo no git:
main.tf 

4 - Inicializar o Terraform.

No terminal, inicialize o diretório de trabalho do Terraform:

terraform init

5 - Planejar a Infraestrutura.

terraform plan

6 - Aplicar a Configuração

terraform apply

7 - Verificar os Recursos

Após a aplicação bem-sucedida, você pode verificar os recursos criados no portal do Azure.


Entando no seu cluster Azure:

az aks get-credentials --resource-group myResourceGroup --name myAKSCluster



# Passos para instalacao do kong

## Instalando Kong via Helm
```shell
helm repo add kong https://charts.konghq.com
helm repo update
helm install kong/ingress --generate-name
```

## Checando PODs da instalacao do kong
```shell
kubectl get pods
```
![pods](/assets/pods.png)

## Checando SVC da instalacao do kong
```shell
kubectl get svc
```
![svcs](/assets/svcs.png)

## Instalacao do httpbin
```shell
kubectl apply -f ingress.yaml
```
![svcs](/assets/httpbin.png)

### Testando o httpbin
```shell
curl http://<IP>/headers

```
![curl](/assets/curl.png)

